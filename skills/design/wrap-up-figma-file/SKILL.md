---
name: wrap-up-figma-file
description: "After a project ships, tidy its Figma file and harvest the patterns it grew into components you can keep building on."
disable-model-invocation: true
---

# Wrap up Figma file

A project just shipped and its Figma file holds everything: flows, error states, explorations, new patterns, and instances detached in the rush to finish. This is the file's **retro**, with two jobs:

- **Tidy**: organise the file so that, months from now, you or another agent can find any shipped screen, state or decision in a minute.
- **Harvest**: find the patterns the project grew (repeated frames, detached instances, near-duplicate components) and build them into well-made components, so the next project in this part of the product starts from them.

The file then lives on as the source of truth for this part of the product. Audit first, act only on what the user approves.

## Steps

1. **Load the playbooks.** Call the Skill tool with "figma-mcp". Read the UX folder config, `FIGMA_STANDARDS.md`, the glossary and the design system docs; if the config is missing, tell the user to run `/setup-codingforux-skills`. Then read [COMPONENTS.md](COMPONENTS.md) and [FILE-STRUCTURE.md](FILE-STRUCTURE.md) in this skill folder.

2. **Get the file and the story.** Ask for the Figma file link and the briefs it delivered. Ask what shipped, and what was explored and dropped: the file can't tell you which. Done when you know the file, its briefs, and which flows shipped.

3. **Inventory.** Read the file and record, by node id:
   - every page, section and top-level frame, and the flow and state each belongs to
   - every **detached instance**, grouped by the component it came from, with what changed after detaching
   - every local component and component set, and how many instances each has
   - every **repeated pattern**: frames or layer groups built the same way that aren't components
   - frames that break `FIGMA_STANDARDS.md` naming, and raw values where a token belongs

   Use one scripted read per page that returns a summary, over many small reads. Done when every top-level frame is accounted for.

4. **Plan.** Write the wrap-up plan to the UX folder as `wrap-ups/<file name>.md`, in two parts:
   - **Tidy**: the target page structure, then every move, rename, archive and status change, by node id.
   - **Harvest**: one entry per candidate: the evidence (where it occurs, how often, node ids), the verdict from COMPONENTS.md (reattach, swap to an existing component, extend one, extract a new one, propose to the library, leave), and for each component to build, its API: variants, properties, slots, nested components, name.

   Show the user the plan and walk the Harvest entries one at a time: each is a judgement call. Done when the user has approved, changed or dropped every entry.

5. **Back up.** Ask the user to save a named version in Figma ("Before wrap-up") and wait until they say it's saved. This rewrites much of the file at once.

6. **Tidy.** Apply the approved Tidy entries. Archive instead of deleting.

7. **Harvest.** Build each approved component on the Components page, nested components first. Then replace each occurrence in the shipped frames with an instance, and reattach the detached instances the plan marks. Screenshot each replaced frame against its before state: any visible difference is a bug to fix or a question for the user.

8. **Read back** the file against the plan. Done when every approved entry is applied, or listed as not done with why.

9. **Report.** Tell the user what changed, then hand over what isn't yours to apply:
   - **Library proposals**: components, variants or slots that belong in the shared library, with their evidence, for its owner. The library owner publishes.
   - **Design system entries**: decisions this project made (when to use a new component, which pattern wins) as proposed lines for the design system docs. Write each one only once the user agrees.

   Update the plan file to match what was done, so the next wrap-up of this file starts from it.
