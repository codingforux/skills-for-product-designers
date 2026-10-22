# skills-for-product-designers

## 0.4.2

- figma-writes and implement-ux-brief no longer try to save a named version before writing. The Figma MCP doesn't appear to allow saving versions yet, so the step would end in asking you every time. Figma's automatic version history is the rollback for now; we'll recheck the Figma MCP in a few weeks.

## 0.4.1

- figma-writes now saves a named version to the Figma file's version history (for example "Before <brief>") before the first write to any file that already has content, so you can restore the whole file in one click. If the agent can't save it, it asks you to save one in Figma first. implement-ux-brief saves one version per run, named after the brief, and its UX agents save none of their own, so a run leaves one backup rather than one per ticket.
- The sync folder is gone: restore points were its only use. You can delete the `Sync folder` line from your config.

## 0.4.0

So the skills sit cleanly beside engineering plugins like Matt Pocock's, where "design" can mean system design, names now say **UX**:

- Skills: `to-design-brief` → `to-ux-brief`, `implement-design-brief` → `implement-ux-brief`, `design-review` → `ux-review`, `to-tickets` → `to-ux-tickets`, `to-questionnaire` → `to-ux-questionnaire`, `setup-design-skills` → `setup-codingforux-skills`, `ask-ryan` → `ask-codingforux`.
- Labels: `design-brief` → `ux-brief`, `ready-for-design-agent` → `ready-for-ux-agent`, `ready-for-human` → `ready-for-designer`. The subagents that design tickets are now UX agents.
- The config folder moves from `docs/design/` to `docs/ux/`.
- The block setup writes into `CLAUDE.md` / `AGENTS.md` is now `## UX skills`, wrapped in `<!-- codingforux:start -->` / `<!-- codingforux:end -->` markers. Setup finds and updates its own block by those markers and leaves other plugins' blocks alone, so it no longer overwrites another plugin's `## Agent skills` block.

To migrate, run `/setup-codingforux-skills`: it offers to move `docs/design/` to `docs/ux/` and replace the old block. Rename the labels in your tracker to match.

## 0.3.0

- Two label defaults are renamed so they don't clash with Matt Pocock's skills in the same repo: `ready-for-agent` is now `ready-for-design-agent`, and `ready-for-review` is now `ready-for-designer-review`. To switch an existing setup, rename the labels in your tracker and in `docs/design/labels.md`, or re-run `/setup-design-skills`.
- The subagents that design tickets are now called design agents throughout. "Designer" means a person.

## 0.2.0

- The `## Agent skills` block that setup-design-skills writes now says when to read each file (the config before any design skill or Figma job, the tracker before touching a brief or ticket, the labels before applying one), so agents load the config more reliably. Re-run `/setup-design-skills` to update an existing block.
- setup-design-skills no longer sets up a master design system shared by several products. Every product gets its own complete design folder; if you share standards across products, organise that yourself.
- implement-design-brief now loads figma-writes before its first Figma write, and tells every designer subagent to do the same, so restore points, the call budget and the never-publish rule apply on the main build path.
- design-review and figma-writes keep "brief" for the design brief only. Instructions handed to a subagent are now called its "task".

## 0.1.0

First version. Design skills adapted from Matt Pocock's skills: setup-design-skills, grill-prd, to-questionnaire, to-design-brief, to-tickets, implement-design-brief, explore-variants, design-review, figma-writes, agent-retro and ask-ryan. Includes Matt's writing-for-agents unchanged.
