---
name: wrap-up-figma-file
description: "After a project ships, tidy its Figma file and harvest the components and patterns it grew, so you can keep building on them."
disable-model-invocation: true
---

# Wrap up Figma file

A project just shipped and its Figma file holds everything: flows, error states, explorations, new components and patterns, and instances detached in the rush to finish. This is the file's **retro**, with two jobs:

- **Tidy**: organise the file so that, months from now, you or another agent can find any shipped screen, state or decision in a minute.
- **Harvest**: find the components and patterns the project grew, and make each one something the next project in this part of the product starts from.

A **component** is a building block in Figma: a button, a card, a tab bar. It's found in repeated frames, detached instances and near-duplicate components, and harvesting it means building it well. A **pattern** is a recurring way the product solves a user problem, made of components: an empty state, inline form validation, confirming before a delete, a first-run checklist. Its content and arrangement change from screen to screen, so it is not one component. Harvesting it means choosing the version that wins, documenting when to use it, and keeping one reference example. A pattern may need new components; it never becomes one.

The file then lives on as the source of truth for this part of the product. Audit first, act only on what the user approves.

## Steps

1. **Load the playbooks.** Call the Skill tool with "figma-mcp". Read the UX folder config, `FIGMA_STANDARDS.md`, the glossary and the design system docs; if the config is missing, tell the user to run `/setup-codingforux-skills`. Then read [COMPONENTS.md](COMPONENTS.md) and [FILE-STRUCTURE.md](FILE-STRUCTURE.md) in this skill folder.

2. **Get the file and the story.** Ask for the Figma file link and the briefs it delivered. Ask what shipped, and what was explored and dropped: the file can't tell you which. Done when you know the file, its briefs, and which flows shipped.

3. **Inventory.** Read the file and record, by node id:
   - every page, section and top-level frame, and the flow and state each belongs to
   - every **detached instance**, grouped by the component it came from, with what changed after detaching
   - every local component and component set, and how many instances each has
   - every **repeated build**: frames or layer groups built the same way that aren't components
   - every **pattern**: the same user problem solved across flows, noting where it's solved differently
   - frames that break `FIGMA_STANDARDS.md` naming, and raw values where a token belongs

   Use one scripted read per page that returns a summary, over many small reads. Done when every top-level frame is accounted for.

4. **Plan.** Write the wrap-up plan to the UX folder as `wrap-ups/<file name>.md`, in two parts:
   - **Tidy**: the target page structure, then every move, rename, archive and status change, by node id.
   - **Components**: one entry per candidate: the evidence (where it occurs, how often, node ids), the verdict from COMPONENTS.md (reattach, swap to an existing component, extend one, extract a new one, propose to the library, leave), and for each component to build, its API: variants, properties, slots, nested components, name.
   - **Patterns**: one entry per pattern: the problem it solves, where it occurs, the version that wins and why, the screens that solve it differently and whether to align them, and the components it's made of.

   Show the user the plan and walk the Components and Patterns entries one at a time: each is a judgement call. Done when the user has approved, changed or dropped every entry.

5. **Back up.** Ask the user to save a named version in Figma ("Before wrap-up") and wait until they say it's saved. This rewrites much of the file at once.

6. **Tidy.** Apply the approved Tidy entries. Archive instead of deleting.

7. **Harvest.** Build each approved component on the Components page, nested components first. Then replace each occurrence in the shipped frames with an instance, and reattach the detached instances the plan marks. Screenshot each replaced frame against its before state: any visible difference is a bug to fix or a question for the user. Then put each approved pattern's reference example on the Patterns page, and align the screens the plan says to.

8. **Read back** the file against the plan. Done when every approved entry is applied, or listed as not done with why.

9. **Report.** Tell the user what changed, then hand over what isn't yours to apply:
   - **Library proposals**: components, variants or slots that belong in the shared library, with their evidence, for its owner. The library owner publishes.
   - **Design system entries**: each approved pattern (the problem, when to use it, a link to its reference example) and each decision this project made (when to use a new component over its sibling), as proposed lines for the design system docs. Write each one only once the user agrees.

   Update the plan file to match what was done, so the next wrap-up of this file starts from it.
