#!/usr/bin/env node
// Checks the repo against the rules in the update-skills-repo maintainer skill.
// No dependencies. Run from the repo root: node scripts/check-repo.mjs

import { readFileSync, readdirSync, existsSync, statSync } from "node:fs"
import { join, dirname, normalize, relative } from "node:path"

const root = process.cwd()
const errors = []
const fail = (file, message) => errors.push(`${file}: ${message}`)
const read = (path) => readFileSync(join(root, path), "utf8")

// --- Skills on disk -------------------------------------------------------

const skills = []
for (const bucket of readdirSync(join(root, "skills"))) {
  const bucketDir = join("skills", bucket)
  if (!statSync(join(root, bucketDir)).isDirectory()) continue
  for (const name of readdirSync(join(root, bucketDir))) {
    const dir = join(bucketDir, name)
    if (!existsSync(join(root, dir, "SKILL.md"))) continue
    const text = read(join(dir, "SKILL.md"))
    const frontmatter = text.match(/^---\n([\s\S]*?)\n---/)?.[1] ?? ""
    const field = (key) =>
      frontmatter.match(new RegExp(`^${key}:\\s*(.*)$`, "m"))?.[1].trim().replace(/^["']|["']$/g, "")
    skills.push({
      bucket,
      name,
      dir,
      frontmatterName: field("name"),
      description: field("description"),
      userInvoked: field("disable-model-invocation") === "true",
    })
  }
}

// --- Frontmatter ----------------------------------------------------------

for (const skill of skills) {
  const file = join(skill.dir, "SKILL.md")
  if (skill.frontmatterName !== skill.name)
    fail(file, `frontmatter name "${skill.frontmatterName}" does not match its folder "${skill.name}"`)
  if (!skill.description) fail(file, "frontmatter has no description")
}

// --- plugin.json ----------------------------------------------------------

const plugin = JSON.parse(read(".claude-plugin/plugin.json"))
const listed = plugin.skills ?? []
const onDisk = skills.map((s) => `./${s.dir}`).sort()

for (const path of onDisk)
  if (!listed.includes(path)) fail(".claude-plugin/plugin.json", `skills is missing ${path}`)
for (const path of listed)
  if (!onDisk.includes(path)) fail(".claude-plugin/plugin.json", `skills lists ${path}, which has no SKILL.md`)
if (listed.join("\n") !== [...listed].sort().join("\n"))
  fail(".claude-plugin/plugin.json", "skills is not in alphabetical order")

// --- READMEs --------------------------------------------------------------

const topReadme = read("README.md")
for (const skill of skills) {
  if (!topReadme.includes(`(./${skill.dir}/SKILL.md)`))
    fail("README.md", `no link to ./${skill.dir}/SKILL.md`)

  const bucketReadmePath = join("skills", skill.bucket, "README.md")
  if (!existsSync(join(root, bucketReadmePath))) {
    fail(bucketReadmePath, "bucket has no README.md")
    continue
  }
  const bucketReadme = read(bucketReadmePath)
  const link = `(./${skill.name}/SKILL.md)`
  if (!bucketReadme.includes(link)) {
    fail(bucketReadmePath, `no link to ${link}`)
    continue
  }
  // The link must sit under the heading that matches how the skill is invoked.
  const heading = skill.userInvoked ? "## User-invoked" : "## Model-invoked"
  const sections = bucketReadme.split(/^(?=## )/m)
  const section = sections.find((s) => s.includes(link)) ?? ""
  if (!section.startsWith(heading))
    fail(bucketReadmePath, `${skill.name} should be listed under "${heading}"`)
}

// --- agents/openai.yaml pairing -------------------------------------------

for (const skill of skills) {
  const yamlPath = join(skill.dir, "agents", "openai.yaml")
  const yaml = existsSync(join(root, yamlPath)) ? read(yamlPath) : ""
  const implicitOff = /allow_implicit_invocation:\s*false/.test(yaml)
  if (skill.userInvoked && !implicitOff)
    fail(yamlPath, "user-invoked skill needs policy.allow_implicit_invocation: false")
  if (!skill.userInvoked && implicitOff)
    fail(yamlPath, "model-invoked skill must not set allow_implicit_invocation: false")
}

// --- Router ---------------------------------------------------------------

const router = skills.find((s) => s.name.startsWith("ask-"))
if (router) {
  const routerText = readdirSync(join(root, router.dir))
    .filter((f) => f.endsWith(".md"))
    .map((f) => read(join(router.dir, f)))
    .join("\n")
  for (const skill of skills) {
    if (skill === router || skill.bucket !== router.bucket) continue
    if (!routerText.includes(skill.name))
      fail(join(router.dir, "SKILL.md"), `router never mentions ${skill.name}`)
  }
}

// --- Version and changelog ------------------------------------------------

const topEntry = read("CHANGELOG.md").match(/^## (\S+)/m)?.[1]
if (topEntry !== plugin.version)
  fail("CHANGELOG.md", `top entry is ${topEntry}, but plugin.json version is ${plugin.version}`)

// --- Prose rules and links, over every tracked text file --------------------

const textFiles = []
const walk = (dir) => {
  for (const entry of readdirSync(join(root, dir), { withFileTypes: true })) {
    if ([".git", "node_modules", "results"].includes(entry.name)) continue
    const path = join(dir, entry.name)
    if (entry.isDirectory()) walk(path)
    else if (/\.(md|ya?ml|json)$/.test(entry.name)) textFiles.push(path)
  }
}
walk(".")

for (const file of textFiles) {
  const text = read(file)
  text.split("\n").forEach((line, i) => {
    if (line.includes("—")) fail(`${file}:${i + 1}`, "em dash: use a colon, comma or full stop")
  })
  if (!file.endsWith(".md")) continue
  for (const match of text.matchAll(/\]\(([^)\s]+)\)/g)) {
    const target = match[1]
    // Skip web links, in-page anchors and template placeholders such as <slug>.md.
    if (/^(https?:|mailto:|#|<)/.test(target)) continue
    const path = normalize(join(dirname(file), target.split("#")[0]))
    if (!existsSync(join(root, path))) fail(file, `broken link: ${target}`)
  }
}

// --- Report ---------------------------------------------------------------

if (errors.length) {
  console.error(`${errors.length} problem${errors.length === 1 ? "" : "s"}:\n`)
  for (const e of errors) console.error(`  ${relative(".", e)}`)
  process.exit(1)
}
console.log(`OK: ${skills.length} skills, ${textFiles.length} files checked.`)
