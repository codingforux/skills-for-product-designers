---
name: wrap-up-figma-file
description: "After a project ships, tidy its Figma file and harvest the components and patterns it grew, so you can keep building on them."
disable-model-invocation: true
---

# Wrap up Figma file

A project just shipped and its Figma file holds everything: flows, error states, explorations, new components and patterns, and instances detached in the rush to finish. This is the file's **retro**, with two jobs:

- **Tidy**: organise the file so that, months from now, you or another agent can find any shipped screen, state or decision in a minute.
- **Harvest**: find the components and patterns the project grew, and make each one something the next project in this part of the product starts from.

A **component** is a building block in Figma: a button, a card, a tab bar. It's found in repeated frames, detached instances and near-duplicate components, and harvesting it means building it well. A **pattern** is a recurring way the product solves a user problem, made of components: a form, an empty state, inline validation, confirming before a delete. Harvesting it means choosing the version that wins, documenting when to use it, and keeping one reference example. When its **shell** is the same every time and only the inside varies (a form: title, fields, submit), it is also built as a component, with the varying part as a slot or properties. When the arrangement itself changes from screen to screen (confirming a delete is a dialog here and an inline undo there), it stays documented.

The file then lives on as the source of truth for this part of the product. Audit first, act only on what the user approves.

## Steps

1. **Load the playbooks.** Call the Skill tool with "figma-mcp". Read the UX folder config, `FIGMA_STANDARDS.md`, the glossary and the design system docs; if the config is missing, tell the user to run `/setup-codingforux-skills`. Then read [COMPONENTS.md](COMPONENTS.md) and [FILE-STRUCTURE.md](FILE-STRUCTURE.md) in this skill folder.

2. **Get the file and the story.** Ask for the Figma file link and the briefs it delivered. Ask what shipped, and what was explored and dropped: the file can't tell you which. Ask where this team keeps components for this part of the product, unless the config or design system docs say. Done when you know the file, its briefs, which flows shipped, and where new components go.

3. **Inventory.** Read the file and record, by node id:
   - every page, section and top-level frame, and the flow and state each belongs to
   - every **detached instance**, grouped by the component it came from, with what changed after detaching
   - every local component and component set, and how many instances each has
   - every **repeated build**: frames or layer groups built the same way that aren't components
   - every **pattern**: the same user problem solved across flows, noting where it's solved differently
   - frames that break `FIGMA_STANDARDS.md` naming, and raw values where a token belongs

   Read **lean** either way: one script per page that returns only ids, names and counts, never node trees or screenshots, split by section when a page is too big for one call's output. A big file's full trees would flood your context long before the inventory is done.

   Then pick the read path:
   - **A bridge**: if the user has a Figma MCP bridge connected (a plugin running in their Figma desktop app, outside the Figma MCP's call limit), or the config or `FIGMA_MCP_FINDINGS.md` names one, do the inventory through it. Ask the user once whether one is connected when neither says.
   - **The Figma MCP**: reads count against the plan's call limit, and a big file spends it fast. Count the pages and top-level frames from one metadata read, estimate the inventory's calls, and tell the user before going on. If the estimate runs past the limit, agree which pages to inventory now and which next time.

   Done when every top-level frame is accounted for.

4. **Plan.** Write the wrap-up plan to the UX folder as `wrap-ups/<file name>.md`, in two parts:
   - **Tidy**: the target page structure, then every move, rename, archive and status change, by node id.
   - **Components**: one entry per candidate: the evidence (where it occurs, how often, node ids), the verdict from COMPONENTS.md (reattach, swap to an existing component, extend one, extract a new one, propose to the library, leave), and for each component to build, its API: variants, properties, slots, nested components, name.
   - **Patterns**: one entry per pattern: the problem it solves, where it occurs, the version that wins and why, the screens that solve it differently and whether to align them, the components it's made of, and whether its shell is built as a component (then it also gets a Components entry).

   Show the user the plan and walk the Components and Patterns entries one at a time: each is a judgement call. Done when the user has approved, changed or dropped every entry.

5. **Back up.** Ask the user to save a named version in Figma ("Before wrap-up") and wait until they say it's saved. This rewrites much of the file at once.

6. **Tidy.** Apply the approved Tidy entries. Archive instead of deleting.

7. **Harvest.** Build each approved component where new components go, nested components first. Then replace each occurrence in the shipped frames with an instance, and reattach the detached instances the plan marks. Screenshot each replaced frame against its before state: any visible difference is a bug to fix or a question for the user. Then put each approved pattern's reference example on the Patterns page, and align the screens the plan says to.

8. **Read back** the file against the plan. Done when every approved entry is applied, or listed as not done with why.

9. **Report.** Tell the user what changed, then hand over what isn't yours to apply:
   - **Library proposals**: components, variants or slots that belong in the shared library, with their evidence, for its owner. The library owner publishes.
   - **Design system entries**: each approved pattern (the problem, when to use it, a link to its reference example) and each decision this project made (when to use a new component over its sibling), as proposed lines for the design system docs. Write each one only once the user agrees.

   Update the plan file to match what was done, so the next wrap-up of this file starts from it.
