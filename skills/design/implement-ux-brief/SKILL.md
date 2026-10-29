---
name: implement-ux-brief
description: "Design a brief in Figma from its tickets, using parallel UX agents."
disable-model-invocation: true
---

You have been given a UX brief. It should have tickets as sub-issues, describing how to design it. A brief small enough to be one slice may have none: then design it yourself, as a single UX agent would.

The goal is the whole brief designed in one Figma file, through the Figma MCP, ready for the user to review.

The tickets are not a list of steps. They are a **task graph** with blocking relationships between them. This means there is always a **frontier** of tickets which are ready to be grabbed.

Communication to and from subagents should be sparse. Communicate primarily through **context pointers**: to the brief, the tickets, `FIGMA_STANDARDS.md`, the glossary and design system docs in the UX folder, and the frames already built. Don't duplicate information already available via pointers.

**UX agents** should be run in the background where possible for **maximum concurrency**. Tell each one to call the Skill tool with "figma-mcp" before its first Figma call.

## Steps

1. Read the brief and its tickets. Read enough to understand the task graph.

2. Call the Skill tool with "figma-mcp" before your first Figma call. Find the Figma file to design in: the one already linked on the brief, if any; else a file the user points you to; otherwise, where the UX folder config says design files go: a new file named after the brief, created through the Figma MCP in the project folder, or the product file. Comment its link on the brief. Then make one page per ticket in it, named after the ticket, so UX agents never write to the same frames.

3. If the happy path ticket (the one the others are blocked by) is still open, design it alone, with one UX agent working as in step 4. Label it `ready-for-designer-review`, hand the user its frames, and **stop**: the rest waits. The user reviews it, explores variations if they want (the explore-variants skill), and closes the ticket once the direction is approved. Then they run `/implement-ux-brief` again, which skips to step 4.

4. Use **UX agents** to design each `ready-for-ux-agent` ticket on the frontier, building on the approved happy path frames. Point them at frames only by the frame links on the tickets (the latest link wins): they never search the file, and ask the user if a link is missing. When done, each annotates its frames in Figma with a link to its ticket, under the `Agent` annotation category (created if the file has none), so a person who finds them knows where they came from, and comments links to its frames on the ticket. `ready-for-designer` tickets are the user's: one is done once the user closes it.

5. If a finished ticket changes the **frontier**, kick off more **UX agents** on the newly unblocked tickets.

6. Once all tickets are designed, call the Skill tool with "ux-review" on the whole brief, passing the frame links from its tickets. Fix every hard violation in a single **UX agent**, and re-run the review until it reports none.

7. Hand the user the frame links and the judgement calls to review, like a pull request. List any `ready-for-designer` tickets still open and what they block; when the user closes one, carry on from step 5. Figma's version history is the record: write no findings file.
