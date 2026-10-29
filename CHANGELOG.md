# skills-for-product-designers

## 0.7.0

- New skill, `/wrap-up-figma-file`, for when a project ships and its Figma file holds everything. It reads the whole file, then plans a **tidy** (a cover, one page per shipped flow with every state side by side, a components page, an archive that keeps why each idea lost) and a **harvest** (which repeated patterns and detached instances become components, and how to build each: variants, properties or, only when the frames prove they're needed, tightly limited slots). It walks you through every component decision, asks you to save a version in Figma, then applies what you approved. Components that belong in the shared library come back as proposals for its owner, and the decisions the project made come back as proposed design system entries.
- ask-codingforux routes to it after a project ships.

## 0.6.0

- `figma-writes` is now `figma-mcp`, the playbook for every Figma MCP job, reads as well as writes. It adds a short section on reading: read by node, and read each frame once. If you call `/figma-writes` yourself, call `/figma-mcp` now.
- ux-review and handoff-to-matt-pocock-skills now load it before their first Figma call, so your team's `FIGMA_MCP_FINDINGS.md` reaches every skill that touches Figma, not only the ones that write. explore-variants and implement-ux-brief load it before their first Figma call, not their first write.

## 0.5.1

- Briefs follow the usual PRD shape: Problem, Goals and Success Metrics, Users, User Stories, Requirements, Design Scope, Out of Scope, Open Questions.
- User stories and requirements are now apart. A story is a piece of the design a persona can use, with acceptance criteria under it where "done" isn't obvious. Rules that cut across stories, like naming, ordering, shortcuts and what's removed, go under **Requirements** as plain statements: functional (R1, R2…) and non-functional (N1, N2…), which replaces Constraints. Success Criteria becomes Goals and Success Metrics, near the top.
- to-ux-tickets puts stories with their acceptance criteria and functional requirements on each ticket's checklist and leaves none uncovered; ux-review's Brief check, handoff-to-matt-pocock-skills and explore-variants read them all.

## 0.5.0

- New optional skill, `/handoff-to-matt-pocock-skills`, for teams that build with Matt Pocock's engineering skills. Run it in the code repo once a brief's tickets are approved: it reads the brief and the Figma frames its tickets link (states, components and their Code Connect mappings, tokens, interactions, copy, annotations), lays out a handoff for you to check, then tells you to run his `/to-spec` in the same session, followed by `/to-tickets` and `/implement`. Afterwards it links the spec on the brief. It needs the `mattpocock-skills` plugin, and nothing else in this plugin depends on it, so you can ignore it if you don't use his skills.
- ask-codingforux routes to it as an optional step after implement-ux-brief.

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
