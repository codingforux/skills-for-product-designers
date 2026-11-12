---
name: implement-ux-brief
description: "Design a brief in Figma from its tickets, pass by pass, using parallel UX agents and stopping for the designer's review after each pass."
disable-model-invocation: true
---

You have been given a UX brief. It should have tickets as sub-issues, describing how to design it. A brief small enough to be one slice may have none: then design it yourself, as a single UX agent would.

The goal is the whole brief designed in one Figma file, through the Figma MCP, one **pass** at a time: each ticket's Pass section says which pass it's in, and the user reviews every pass before the next one opens.

The tickets are not a list of steps. They are a **task graph** with blocking relationships between them. This means there is always a **frontier** of tickets which are ready to be grabbed: a ticket is on it when each of its blockers is closed or, inside the current pass, designed.

Communication to and from subagents should be sparse. Communicate primarily through **context pointers**: to the brief, the tickets, `FIGMA_STANDARDS.md`, the glossary and design system docs in the UX folder, and the frames already built. Don't duplicate information already available via pointers.

**UX agents** should be run in the background where possible for **maximum concurrency**. Tell each one to call the Skill tool with "figma-mcp" before its first Figma call.

## Steps

1. Read the brief and its tickets. Read enough to understand the task graph.

2. Call the Skill tool with "figma-mcp" before your first Figma call. Find the Figma file to design in: the one already linked on the brief, if any; else a file the user points you to; otherwise, where the UX folder config says design files go: a new file named after the brief, created through the Figma MCP in the project folder, or the product file. Comment its link on the brief. Then make one page per ticket in it, named after the ticket, so UX agents never write to the same frames.

3. Find the **current pass**: the latest pass with a ticket that is labelled or closed. Tickets with no Pass section, published before passes existed, make two passes: the happy path ticket (the one the others are blocked by) alone, then the rest.
   - **No ticket labelled yet** → open pass 1.
   - **Tickets labelled `ready-for-ux-agent`** → step 4.
   - **Every agent ticket designed** (`ready-for-designer-review` or closed) → the pass is with the user, and this run is their **go**: open the next pass and carry on from step 4. After the last pass, tell the user the brief is designed.

   To **open** a pass, label each of its tickets `ready-for-ux-agent`, or `ready-for-designer` when its Pass section says human.

4. Use **UX agents** to design each `ready-for-ux-agent` ticket on the frontier, building on the frames the user has approved. Point them at frames only by the frame links on the tickets (the latest link wins): they never search the file, and ask the user if a link is missing. When done, each annotates its frames in Figma with a link to its ticket, under the `Agent` annotation category (created if the file has none), so a person who finds them knows where they came from, comments links to its frames on the ticket, and relabels the ticket from `ready-for-ux-agent` to `ready-for-designer-review`. `ready-for-designer` tickets are the user's: one is done once the user closes it.

5. If a finished ticket changes the **frontier**, kick off more **UX agents** on the newly unblocked tickets in the current pass.

6. Once every agent ticket in the current pass is designed, call the Skill tool with "ux-review" on the pass, passing the frame links from its tickets. Fix every hard violation in a single **UX agent**, and re-run the review until it reports none.

7. Hand the user the pass's frame links and the judgement calls to review, like a pull request, then **stop**. List any `ready-for-designer` tickets still open and what they block, and name the tickets the next pass holds. The user reviews, explores variations if they want (the explore-variants skill), closes each ticket they approve, and gives the go: saying go in this session, or running `/implement-ux-brief` again, takes you back to step 3. A ticket they leave open keeps blocking its dependents. Figma's version history is the record: write no findings file.
