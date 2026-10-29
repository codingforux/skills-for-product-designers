---
name: ask-codingforux
description: Ask which UX skill or flow fits your situation. A router over the skills in this set.
disable-model-invocation: true
---

# Ask codingforux

You don't remember every skill, so ask.

A **flow** is a path through the skills. Most paths run along one **main flow**: a PM's PRD in, a handed-off design out. Everything else is standalone, or a discipline that runs underneath.

## The main flow: PRD → reviewed designs

The route most work travels. A PM hands you a PRD and you design it.

1. **`/grill-prd`** sharpens your understanding of the PRD by interview. Paste it, or pass a file, a doc link or a tracker issue. It reads only the personas the PRD affects, marks each PRD item **yours**, **not yours** or **needs alignment**, and parks every question only your team can answer as a `needs-alignment` sub-issue of the brief.
2. **Branch: is anything parked?**
   - **Yes** → **`/to-ux-questionnaire`** gathers the open `needs-alignment` questions into one message. **You** send it; the agent never messages anyone. When the answers come back, bring them to `/to-ux-questionnaire` and it closes each question with its answer recorded.
   - **No** → go straight to step 3.

   If the PM replies with a **new PRD draft** rather than answers, re-run **`/grill-prd`** on it: it compares against the saved snapshot and asks only about what changed.
3. **`/to-ux-brief`** writes the whole brief from the conversation and publishes it as the `ux-brief` issue: problem, goals and success metrics, users, user stories with your personas as actors and their acceptance criteria, requirements (the rules the design must follow, like naming or ordering, and its limits, like platform), scope, out of scope, open questions. Scope changed later? Discuss it (usually by re-running `/grill-prd`), then run `/to-ux-brief` with the brief's link: it shows you a short diff of what changed to approve.
4. **Branch: is this bigger than one slice?**
   - **Yes** → **`/to-ux-tickets`** splits the brief into thin vertical slices, each designed completely and reviewable on its own, published as `ready-for-ux-agent` sub-issues (or `ready-for-designer`, for the few only you can design) of the brief, blockers first. Then run **`/implement-ux-brief`** on the brief, **starting fresh**: it designs the happy path first and stops for your review. Want options? Ask for variations and **explore-variants** lays a few out in Figma next to it. Close that ticket once you're happy, then run it again: it works the rest of the ticket graph with one UX agent per ticket, in parallel where blockers allow.
   - **No** → **`/implement-ux-brief`** on the brief itself.

   Either way, **`/implement-ux-brief`** builds frames from your library, following `FIGMA_STANDARDS.md` from the start, then runs **`/ux-review`** and fixes every hard violation itself. What's left for you is the judgement calls and the frames to review, like a pull request.
5. **Optional: handing off to code.** If your team builds with Matt Pocock's engineering skills, run **`/handoff-to-matt-pocock-skills`** in the code repo once every ticket is approved. It reads the brief and the frames and lays out the handoff, then you run his **`/to-spec`** in the same session, followed by his `/to-tickets` and `/implement`. Not using his skills? Skip this step.
6. **`/wrap-up-figma-file`**, once the project ships. Its Figma file holds everything by then: flows, states, explorations, detached instances. It plans a tidy (one page per shipped flow, an archive for what didn't ship) and a harvest (which patterns become components, and how: variants, properties or slots), walks you through each component decision, then applies what you approve. Library proposals and design system entries come back to you to pass on.
7. **`/agent-retro`**, after a session that went wrong or cost a lot of Figma calls. It suggests fixes to your standards, design system docs, glossary or Figma MCP findings, most serious first, and writes only the ones you approve.

### Context hygiene

Keep steps 1–4 in **one unbroken context window** where you can, so the grilling, brief and tickets all build on the same thinking. The same goes for `/handoff-to-matt-pocock-skills` and `/to-spec`: run them back to back, since `/to-spec` writes from the conversation. Your team's reply often takes days, and that's fine: the PRD snapshot, the brief and its `needs-alignment` sub-issues carry what was settled, so a new session picks up from them. `/implement-ux-brief` starts fresh, working from the brief and its tickets.

If a session runs long before `/to-ux-tickets`, don't push on degraded; compact at the nearest phase boundary and carry on (see Phase boundaries).

## Underneath

One model-invoked reference runs *beneath* the other skills whenever the agent reads or writes Figma. Reach for it directly when a **Figma MCP call** is the problem, or let the skills above pull it in. Token rules come from your design system docs and `FIGMA_STANDARDS.md`, not a skill.

- **`/figma-mcp`**: the playbook for reading and changing Figma files safely through the Figma MCP: account, call budget, reading by node, batching, never publishing the library. It also loads your team's Figma MCP findings.

## Phase boundaries

A **phase** is a chunk of work inside a session: the grilling, the brief, one ticket's design. At the **boundary** between two of them you have four options:

- **Continue**: stay put. Costs nothing, loses nothing.
- **Clear**: start a new session, when nothing here matters to what's next.
- **Subagent**: send a tightly-scoped task to its own window and get a report back.
- **Compact**: compress this context and carry on with the summary. The **default**, at the bottom of the tree rather than the first reach.

Read [PHASE-BOUNDARIES.md](PHASE-BOUNDARIES.md) for the ordered tree and the reasoning behind each branch. Make the decision **at** a boundary; mid-phase, continue or split the rest into subagents.

## Standalone

Off the main flow.

- **`/ux-review`**: review any Figma page or frames against a brief or ticket, on three axes in parallel (System, Brief, Completeness). Each finding is a hard violation or a judgement call. Reports in chat; it posts Figma comments only when you ask. Reach for it on its own whenever you want a second look at a design, yours or anyone's.
- **`/to-ux-questionnaire`** also works outside the main flow: whenever what's blocking you is in **someone else's** head, it writes them the questions to answer.

## Precondition

**`/setup-codingforux-skills`**: run once per product before your first flow. It checks the Figma MCP can write (and stops if it can't), then sets up the UX folder, issue tracker, labels, Figma files, standards, glossary and personas the other skills assume.
