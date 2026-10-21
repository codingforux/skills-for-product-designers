# skills-for-product-designers

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
