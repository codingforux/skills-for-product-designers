---
name: improve-repo
description: Ship a change to this repo's published skills package. Use when adding, editing, renaming or removing a skill, or changing the README, manifests or changelog.
metadata:
  internal: true
---

# Improve repo

Every change ships as a **release**: one branch, one PR into `main`, one version bump. Claude Code only updates installs when `plugin.json`'s `version` changes, so an unbumped change never reaches anyone.

1. Call the Skill tool with "writing-for-agents" before you write any skill or doc an agent reads. Leave `skills/productivity/writing-for-agents/` unchanged: it is Matt's, synced from [mattpocock/skills](https://github.com/mattpocock/skills).
2. Make the change on a new branch. Done when every rule below holds for every skill you touched.
3. When anything under `skills/` or `.claude-plugin/plugin.json` changes, bump `version` in `.claude-plugin/plugin.json` (patch for a fix or rewording, minor for a new, removed or behaviour-changing skill) and add a matching `## <version>` entry at the top of `CHANGELOG.md` saying what changed for the designer using the skill.
4. Run `claude plugin validate . --strict` and fix until it passes.
5. Open the PR into `main`, then stop: Ryan merges.

## Rules

- **Buckets**: skills live in `skills/design/` or `skills/productivity/`. Each shipped skill is linked to its `SKILL.md` in three places: `plugin.json`'s `skills` array (alphabetical), the top-level `README.md` table, and its bucket `README.md`. Both READMEs group entries into user-invoked and model-invoked.
- **Invocation**: every skill has `agents/openai.yaml` beside `SKILL.md`. A user-invoked skill sets `disable-model-invocation: true` and `policy.allow_implicit_invocation: false` together, with a one-line human-facing description. A model-invoked skill sets neither and keeps trigger branches in its description.
- **Router**: when a user-reachable skill is added, renamed, removed, or changes where it sits in a flow, update `skills/design/ask-ryan/` so it routes to exactly the skills that exist.
- **Dependencies**: one skill reaches another by "Call the Skill tool with "<name>"", only when the target is model-invoked. For a user-invoked target, tell the user to run `/<name>`.
- **Prose**: commas, colons, periods or parentheses where a sentence wants a dash; the repo has no em-dashes.
- **Maintainer skills**: skills for working on this repo live in `.agents/skills/`, symlinked into `.claude/skills/` for Claude Code, and stay out of `plugin.json` and both READMEs. Each sets `metadata.internal: true` so skills.sh hides it from public installs.
