# Skills For Product Designers

Agent skills for product designers: take a PM's PRD and come out with reviewed designs in Figma.

This is a product-design fork of Matt Pocock's [Skills For Real Engineers](https://github.com/mattpocock/skills). It keeps his approach: small skills you can read in a few minutes, that compose into flows, and that work with any agent. Hack around with them and make them your own.

## How it works

Most work runs along one main flow, from a PRD in to a handed-off design out:

1. **`/grill-prd`** interviews you about the PRD. It sorts each item into **yours**, **not yours** or **needs alignment**, and parks questions only your team can answer.
2. **`/to-ux-questionnaire`** gathers those parked questions into one message for you to send, then records the answers when they come back.
3. **`/to-ux-brief`** writes the UX brief from the conversation and publishes it to your issue tracker.
4. **`/to-ux-tickets`** splits a bigger brief into thin slices, each one you can design, review and hand off on its own.
5. **`/implement-ux-brief`** designs the brief in Figma from your library, one UX agent per ticket, then runs **`ux-review`** and fixes the hard violations itself. You review what's left, like a pull request.
6. Optional: **`/handoff-to-matt-pocock-skills`** hands the approved design to Matt Pocock's engineering skills, so his `/to-spec` writes the code spec from your brief and frames. Skip it if your team doesn't use his skills.
7. **`/agent-retro`** suggests fixes to your standards and docs after a session that went wrong, and writes only the ones you approve.

Not sure which skill fits? Run **`/ask-codingforux`**.

## Requirements

- An agent that supports skills (Claude Code, or any agent that reads a skills folder).
- The **Figma MCP**, signed in with an account that can edit your team's files. The skills write to Figma, and there is no read-only mode.
- An issue tracker for briefs and tickets: **GitHub** (`gh` CLI), **GitLab** (`glab` CLI), or **local Markdown** files if you work solo or without a repo.

## Installation

### Claude Code

```
/plugin install skills-for-product-designers --marketplace codingforux/skills-for-product-designers
```

### Any agent

Copy the folders under `skills/` into your agent's skills folder.

### Set up a product

Run **`/setup-codingforux-skills`** once per product. It checks the Figma MCP can write, then asks about your issue tracker, labels, Figma libraries, design system docs, glossary and personas, and writes the starter files to `docs/ux/`.

## The skills

### Design

You run these yourself:

| Skill | What it does |
| --- | --- |
| [setup-codingforux-skills](./skills/design/setup-codingforux-skills/SKILL.md) | Configure a product for these skills. Run once first. |
| [grill-prd](./skills/design/grill-prd/SKILL.md) | Interview you about a PM's PRD, sorting what's yours from what only your team can answer. |
| [to-ux-questionnaire](./skills/design/to-ux-questionnaire/SKILL.md) | Gather the open questions into one message for your team, then record the answers. |
| [to-ux-brief](./skills/design/to-ux-brief/SKILL.md) | Turn the conversation into a UX brief on the tracker, or update one when scope changes. |
| [to-ux-tickets](./skills/design/to-ux-tickets/SKILL.md) | Split a brief into thin tickets you can design, review and hand off on their own. |
| [implement-ux-brief](./skills/design/implement-ux-brief/SKILL.md) | Design the whole brief in Figma with parallel subagents, then review it and fix hard violations. |
| [handoff-to-matt-pocock-skills](./skills/design/handoff-to-matt-pocock-skills/SKILL.md) | Optional. Hand an approved brief and its Figma frames to Matt Pocock's `/to-spec` for the code side. |
| [agent-retro](./skills/design/agent-retro/SKILL.md) | Suggest improvements to your standards, docs, glossary or Figma MCP findings after a session. |
| [ask-codingforux](./skills/design/ask-codingforux/SKILL.md) | Ask which skill or flow fits your situation. |

The agent reaches for these on its own (you can also call them directly):

| Skill | What it does |
| --- | --- |
| [explore-variants](./skills/design/explore-variants/SKILL.md) | Lay out several radically different variants in Figma, to pick a direction. |
| [ux-review](./skills/design/ux-review/SKILL.md) | Review Figma frames on three axes: System, Brief and Completeness. |
| [figma-writes](./skills/design/figma-writes/SKILL.md) | The playbook for writing to Figma safely through the Figma MCP. |

### Productivity

| Skill | What it does |
| --- | --- |
| [writing-for-agents](./skills/productivity/writing-for-agents/SKILL.md) | How to write skills, `AGENTS.md`/`CLAUDE.md` and other docs agents read. Taken unchanged from Matt's repo. |

## Credits

Built on [Skills For Real Engineers](https://github.com/mattpocock/skills) by [Matt Pocock](https://www.aihero.dev). The UX skills adapt his engineering flows (grilling, spec to tickets, implementation with subagents, review) to design work in Figma, and `writing-for-agents` is his, unchanged. If these are useful to you, his originals are well worth a look.

## License

MIT. See [LICENSE](./LICENSE). Matt Pocock's original copyright notice is kept alongside this fork's.
