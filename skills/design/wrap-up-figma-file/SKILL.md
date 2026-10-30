---
name: wrap-up-figma-file
description: "Use after a project ships to tidy its Figma file and harvest the components and patterns it grew."
disable-model-invocation: true
---

# Wrap up Figma file

A project just shipped and its Figma file holds everything: flows, error states, explorations, new components and patterns, and instances detached in the rush to finish. This is the file's **retro**, with two jobs:

- **Tidy**: organise the file so that, months from now, designers can find any shipped screen, state or decision.
- **Harvest**: find the components and patterns the project grew, and make each one something that can be used or easily worked on in the future.

Three distinctions:

- A **UI component** is a design system idea: a reusable UI element with one job and a defined API, that designers and engineers name the same way: a button, a card, a tab bar. Plain "component" in this skill means a UI component.
- A **Figma component** is Figma's mechanism for making anything reusable: a main component and its instances. Every UI component is built as a Figma component, but a Figma component can also be a pattern's shell, a cover template or an annotation.
- A **pattern** is a recurring way the product solves a user problem, made of UI components: a form, an empty state, inline validation, confirming before a delete. Harvesting it means choosing the version that wins, documenting when to use it, and keeping one reference example. When its **shell** is the same every time and only the inside varies (a form: title, fields, submit), it is also built as a Figma component, with the varying part as a slot or properties. When the arrangement itself changes from screen to screen (confirming a delete is a dialog here and an inline undo there), it stays documented.

The file then lives on as the source of truth for this part of the product.

## Coordinator and subagents

A big file's reads and writes would bury the plan in your context. So you are the **coordinator**: you hold the story, the seams and the plan, and talk to the user. **Subagents** do every page-sized read and every write, each in its own context, and report back in a few lines.

- Brief each one through **context pointers**, not pasted content: the file key and node ids, the plan file and the entry ids it owns, this skill's reference file it needs, and the read path from step 3.
- Tell each to call the Skill tool with "figma-mcp" before its first Figma call.
- Run them in the background, in parallel, unless two would touch the same frames.
- Their reports are lean: what they did, by node id, and anything they couldn't do or that needs the user. Never node trees or screenshots.

## Scratch folder

The inventory and the plan are working files for this run only: they go stale as soon as the file changes. Keep them in a **scratch folder** outside the repo and the UX folder (a new folder in the system temp directory), never in anything that gets committed, and delete it at the end.

## Steps

1. **Load the playbooks.** Call the Skill tool with "figma-mcp". Read the UX folder config, `FIGMA_STANDARDS.md`, the glossary and the design system docs; if the config is missing, tell the user to run `/setup-codingforux-skills`.

2. **Get the file and the story.** Ask for the Figma file link and the briefs it delivered. Ask what shipped, and what was explored and dropped: the file can't tell you which. Ask where this team keeps components for this part of the product, unless the config or design system docs say. Done when you know the file, its briefs, which flows shipped, and where new components go.

3. **Pick the read path.**
   - **A Figma MCP bridge** (a plugin in the Figma desktop app, outside the call limit), when the config or `FIGMA_MCP_FINDINGS.md` names one or the user says one is connected. Ask once when neither says.
   - **The Figma MCP** otherwise: every subagent's calls count against the plan's call limit. From one metadata read of the page list, estimate the whole job's calls and tell the user; past the limit, agree which pages to do now and which next time.

4. **Inventory.** Start one **inventory agent** per page. Each reads its page lean (scripts that return ids, names and counts, split by section when a page is too big for one call), writes `inventory/<page>.md` in the scratch folder, and reports one line. Each records, by node id:
   - every section and top-level frame, and the flow and state each belongs to
   - every **detached instance**, grouped by the Figma component it came from, with what changed after detaching
   - every local Figma component and component set, and how many instances each has
   - every **repeated build**: frames or layer groups built the same way that aren't components
   - every user problem the page's screens solve, for spotting **patterns** across pages
   - frames that break `FIGMA_STANDARDS.md` naming, and raw values where a token belongs

   Done when every page's inventory file exists and every top-level frame is in one.

5. **Find the seams.** Read [FILE-STRUCTURE.md](FILE-STRUCTURE.md) and the inventory files. A **seam** is where the shipped work splits into pages: by flow, by product area (each page of a dashboard), by platform, or a mix. Show the user two or three candidates, each with the pages it makes and what lands on each, recommending one. Done when the user has chosen.

6. **Plan.** Read [COMPONENTS.md](COMPONENTS.md). Write the wrap-up plan to `plan.md` in the scratch folder, giving every entry an id:
   - **Tidy**: the pages along the chosen seams, then every move, rename, archive and status change, by node id.
   - **Components**: one entry per candidate: the evidence (where it occurs, how often, node ids), the verdict from COMPONENTS.md (reattach, swap to an existing component, extend one, extract a new one, propose to the library, leave), and for each component to build, its API (variants, properties, slots, nested components, name), its home (its seam's components page, or `🧩 Shared components`), and the components it nests.
   - **Patterns**: one entry per pattern: the problem it solves, where it occurs, the version that wins and why, the screens that solve it differently and whether to align them, the components it's made of, and whether its shell is built as a Figma component (then the shell also gets an entry under Components).

   Show the user the plan. Take the Tidy section as a whole, as a list of pages with what lands on each, then walk the Components and Patterns entries one at a time: each is a judgement call. Done when the user has approved the Tidy section and approved, changed or dropped every other entry.

7. **Back up.** Ask the user to save a named version in Figma ("Before wrap-up") and wait until they say it's saved. This rewrites much of the file at once.

8. **Tidy.** Start one **tidy agent** with the Tidy entries and FILE-STRUCTURE.md. It applies the moves exactly as the plan places them, and asks you about any frame the plan doesn't place. One agent, since moves cross pages. It archives instead of deleting.

9. **Harvest.** Start one **build agent** per approved Components entry, pointed at its entry and COMPONENTS.md. Each builds its component in its home, replaces the occurrences in the shipped frames with instances, reattaches the detached instances its entry marks, and screenshots each replaced frame against its before state, reporting any visible difference. Start an entry only once the components it nests are built, and run two at once only when their entries share no frame. Then start one **pattern agent** per approved Patterns entry, which puts the reference example on the 📐 Patterns page and aligns the screens its entry names.

10. **Read back.** Start one **check agent** per page of the finished file, comparing it against the plan. Done when every approved entry is applied, or listed as not done with why.

11. **Report.** Tell the user what changed, then hand over what isn't yours to apply:
   - **Library proposals**: components, variants or slots that belong in the shared library, with their evidence, for its owner. The library owner publishes.
   - **Design system entries**: each approved pattern (the problem, when to use it, a link to its reference example) and each decision this project made (when to use a new component over its sibling), as proposed lines for the design system docs. Write each one only once the user agrees.

12. **Clean up.** Delete the scratch folder. The file itself, the report, and the entries the user approved for the design system docs are what lasts.
