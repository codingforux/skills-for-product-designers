---
name: setup-design-skills
description: "Configure a product for the design skills: check Figma access, set up its design folder, issue tracker, labels, Figma files, standards, glossary and personas. Run once before first use of the other design skills."
disable-model-invocation: true
---

# Setup Design Skills

Scaffold the per-product configuration that the design skills assume:

- **Design folder**: where the config, standards, glossary and personas live (always `docs/design/`)
- **Issue tracker**: where briefs, parked questions and tickets live (GitHub by default; local markdown is also supported out of the box)
- **Labels**: the strings used for the five roles `design-brief`, `needs-alignment`, `ready-for-design-agent`, `ready-for-human`, `ready-for-designer-review`
- **Figma files**: the libraries, and where new design files go (a Figma project folder, or one long-lived product file)
- **Standards, glossary and personas**: the project's Figma rules, its own words, and who uses it

This is a prompt-driven skill, not a deterministic script. Explore, present what you found, confirm with the user, then write.

## Process

### 1. Check Figma access

The design skills work in Figma only through the Figma MCP, and they write. Confirm the Figma MCP is connected and exposes its write tool (`use_figma`), then run `whoami` to confirm the signed-in account and its seat can edit files.

If either fails, stop here and tell the user:

> The design skills need the Figma MCP with write access. Connect it (signed in with an account that can edit your team's files), then run `/setup-design-skills` again.

There is no read-only mode. Don't carry on to the next step.

### 2. Explore

Look at the starting state. Read whatever exists; don't assume:

- Is the current directory a repo? `git remote -v` and `.git/config`: GitHub, GitLab, or none?
- `AGENTS.md` and `CLAUDE.md` at the repo root (or the project folder, when there's no repo): does either exist? Is there already an `## Agent skills` section in either?
- `docs/design/`: does this skill's prior output already exist?
- Existing Figma rules, a glossary, personas or research docs anywhere in the repo or folder: candidates to import.
- Existing design-system notes (a design system docs folder, a brand or product registry, Figma file keys): their facts become config.
- Figma URLs in the repo's docs or README: candidate libraries, project folders and product files.

### 3. Present findings and ask

Summarise what's present and what's missing. Then take the sections in order. One section, one answer, then the next.

Lead each section with the recommended answer so the user can accept it in a word. Give a one-line explainer only when the choice genuinely branches; skip the section entirely when exploration already settled it.

**Section A: Design folder.**

> Explainer: The design folder holds everything the design skills read for this product: config, Figma standards, glossary, personas and (with a local tracker) briefs.

The design folder is always `docs/design/`, so every skill finds it the same way. In a repo, it goes at the repo root. Without one, propose a plain project folder such as `~/Design/` and put it at `~/Design/docs/design/`; the project folder then plays the repo root's part (the agent is started there, and its instructions file lives there). One product is the default; don't ask about others. Only when the user is adding a second product, ask for a separate project folder for it (for example `~/Design/<product>/`).

**Section B: Issue tracker.**

> Explainer: The "issue tracker" is where the brief, its parked questions and its tickets live. Skills like `grill-prd`, `to-design-brief` and `to-tickets` read from and write to it. Pick the place you actually track work for this product.

If a `git remote` points at GitHub, propose that. If it points at GitLab (`gitlab.com` or a self-hosted host), propose GitLab. Otherwise (or if the user prefers), offer:

- **GitHub**: issues live in a repo's GitHub Issues (uses the `gh` CLI)
- **GitLab**: issues live in a repo's GitLab Issues (uses the [`glab`](https://gitlab.com/gitlab-org/cli) CLI)
- **Local markdown**: briefs, questions and tickets live as files under `briefs/` in the design folder (good for solo work or no repo)
- **Other** (Jira, Linear, etc.): ask the user to describe the workflow in one paragraph; the skill will record it as freeform prose

When the design folder isn't inside a clone of the tracker's repo, ask which repo (`owner/name`) and record it.

**Section C: Labels.** Ask exactly one question:

> The skills use five labels:
>
> - `design-brief`: a design brief, the parent of its questions and tickets
> - `needs-alignment`: a question only your team can answer
> - `ready-for-design-agent`: a ticket ready for a design agent
> - `ready-for-human`: a ticket only a person can design
> - `ready-for-designer-review`: a designed ticket waiting for your review
>
> Do you want to keep these default labels? (recommended: **yes**)

On **yes**, write them as-is. Only if the user says no, usually because their tracker already uses other names, collect the overrides so the skills apply existing labels instead of creating duplicates. Skip this section for local markdown, which uses the role names as `Status:` values.

**Section D: Figma files.** Ask four things, proposing any links exploration already found:

1. **Libraries.** Which libraries does this product design with? One or more, as links or keys. Take the key from a link (`figma.com/design/<key>/...`; for a branch link, the branch key). Confirm each opens with `get_metadata`. Ask who publishes them (recommended: **only you or your design-system team**; the agent never publishes).
2. **Where design files go.**

    > Most teams make a new Figma file per project, inside a Figma project folder. Some keep one long-lived product file instead. Which do you do? (recommended: **a new file per brief, in a project folder**)

    For a folder, take its link (`figma.com/files/.../project/<id>`) and record the project id. For a product file, take its key and confirm it opens. Either way, the user can point a brief at any other file later.
3. **Design system docs.** Where does the team document its design system: a docs folder, a registry, a docs site, another repo? Record where it is; never copy it, so it can't drift. If there are none, offer the `DESIGN_SYSTEM.md` starter in the design folder (recommended), filled in as decisions come up.
4. **Account.** Which Figma account and team to use. Use `whoami` to list the teams and record the chosen one.

**Section E: Figma standards and glossary.**

> Explainer: `FIGMA_STANDARDS.md` is this project's Figma rules, read while building and reviewing designs. The glossary is the product's own words, e.g. "workspace" not "account".

If exploration found existing rules or a glossary, propose **import**: rewrite them into the starter's shape, keeping every rule and term, and leave the original where it is. Otherwise propose the **starters** as they are; the user fills them in as rules and words come up.

Either way, ask for the default breakpoints, which most products keep the same from one project to the next. Propose any that exploration found (in code, the library or existing rules); otherwise recommend **mobile 375, tablet 768, desktop 1440**. Write them into the Layout section of `FIGMA_STANDARDS.md`.

**Section F: Personas.**

> Explainer: One short file per persona (goals, needs, frustrations, context of use, accessibility needs), plus an index with one line each. Only the skills that need them open them.

If exploration found personas or research, propose **import** into the template's shape. Otherwise propose an **interview**: ask who uses the product, then draft each persona from the answers one at a time, asking about any field you can't fill. Leave a field as "Unknown" rather than invent it.

### 4. Confirm and edit

Show the user a draft of:

- The `## Agent skills` block to add to whichever of `CLAUDE.md` / `AGENTS.md` is being edited (see step 5 for selection rules)
- The contents of `config.md`, `issue-tracker.md` and `labels.md` (the last only when Section C ran)
- The `FIGMA_STANDARDS.md` and `glossary.md` drafts, and each persona with the index

Let them edit before writing.

### 5. Write

**Pick the file to edit:** the agent instructions file at the repo root, or at the project folder's root when there's no repo.

- If `CLAUDE.md` exists, edit it.
- Else if `AGENTS.md` exists, edit it.
- If neither exists, ask the user which one to create; don't pick for them.

Never create `AGENTS.md` when `CLAUDE.md` already exists (or vice versa); always edit the one that's already there.

If an `## Agent skills` block already exists in the chosen file, update its contents in-place rather than appending a duplicate. Don't overwrite user edits to the surrounding sections.

The block (paths relative to the design folder chosen in Section A):

```markdown
## Agent skills

### Design config

[one-line summary: product, libraries, where design files go]. Read `docs/design/config.md` before running any design skill or touching Figma.

### Issue tracker

[one-line summary of where briefs and tickets are tracked]. Read `docs/design/issue-tracker.md` before reading or writing a brief, question or ticket.

### Labels

[one-line summary of the label vocabulary]. Read `docs/design/labels.md` before applying a label.
```

Include the `### Labels` sub-block, and write `labels.md`, only when Section C ran. The block points at the config only: never at the standards, glossary or personas, which the skills open themselves when they need them.

Then write the design folder files using the seed templates in this skill folder as a starting point:

- [config.md](./config.md): Figma files and paths
- [issue-tracker-github.md](./issue-tracker-github.md): GitHub issue tracker
- [issue-tracker-gitlab.md](./issue-tracker-gitlab.md): GitLab issue tracker
- [issue-tracker-local.md](./issue-tracker-local.md): local-markdown issue tracker
- [labels.md](./labels.md): label mapping
- [FIGMA_STANDARDS.md](./FIGMA_STANDARDS.md): starter Figma standards
- [glossary.md](./glossary.md): starter glossary
- [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md): starter design system docs, only when the team has none
- [FIGMA_MCP_FINDINGS.md](./FIGMA_MCP_FINDINGS.md): starter Figma MCP findings, empty until agent-retro adds to it
- [persona.md](./persona.md): one persona, plus the `personas/index.md` format

For "other" issue trackers, write `issue-tracker.md` from scratch using the user's description. On GitHub or GitLab, create each label from `labels.md` that the tracker doesn't have yet (`gh label create <name>` / `glab label create <name>`), so the other skills can apply them.

### 6. Done

Tell the user the setup is complete and which design skills will now read from these files. Mention they can edit the design folder files directly later; re-running this skill is only necessary if they want to switch issue trackers, add a second product, or restart from scratch.
