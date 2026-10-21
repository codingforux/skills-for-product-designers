# Phase boundaries

A **phase** is a chunk of work inside a session: the grilling, the brief, one ticket's design, the handoff. The definition is fuzzy on purpose: a phase ends when you think *"ok, we're done with that"*.

The **phase boundary** is the gap between two phases, and it is the only place this decision belongs. Mid-phase there is no decision to make: continue, or split the work that's left into subagents. Compacting mid-phase makes the agent lose the thread.

## The four options

| Option       | What it does                                                    |
| ------------ | --------------------------------------------------------------- |
| **Continue** | Stay in the session. No context switch at all.                  |
| **Clear**    | Start a new session from nothing.                               |
| **Subagent** | Send the task to its own context window and get a report back.  |
| **Compact**  | Compress this context and carry on with the summary.            |

## The tree

Work top to bottom at the boundary. The first **yes** wins.

**1. Can you continue in this session?** Two things make the answer yes: the next phase needs this phase as a **primary source**, or you have enough room left in the window for the next phase to fit. Grilling → brief is the standard yes: the brief wants the reasoning verbatim, not a summary of it. Continue costs nothing and loses nothing, so rule it out before anything else.

**2. Is the context irrelevant to what comes next?** Is everything in this session (the exploration, the decisions, the dead ends) disposable? If so, **clear**. Moving from one ticket's design to the next is the standard case: the ticket carries what the next one needs.

The cost of getting this wrong is one-way. Clear a *relevant* context and you lose the **why** behind what you designed, and no amount of looking at the frames gets it back.

**3. Can the task be done AFK?** Is it scoped tightly enough to run with you away from the keyboard, no steering? Then send it to a **subagent** and leave this session untouched. Review is the standard case: `/ux-review` already runs its three axes this way.

**4. Otherwise, compact.** Relevant context, and you need to stay in the loop: this is where the tree lands, and it lands here often. Tell it what's next (*"compact, we're writing the brief next"*) so the summary keeps what the next phase needs.

Compact is the **default, not the first reach**. It sits at the bottom because the three questions above it are all cheaper or more precise. The failure mode when people start here is a fresh session that is confidently wrong about a decision the summary flattened.

## Primary and secondary sources

Every move except **Continue** turns a **primary source** into a **secondary source**: the session as it happened, replaced by a summary of it. The trade is always the same shape:

| Source              | Information | Noise | Room to move |
| ------------------- | ----------- | ----- | ------------ |
| Primary (Continue)  | Full        | Lots  | Little       |
| Secondary (Compact) | Lossy       | Less  | Lots         |

This is why question 1 comes first. You only pay the lossiness when staying costs more than it saves.

## These are judgement calls

The questions are not objective: each has taste in it, and the same boundary can go two ways on two days. The value is in asking them **in order**, at the boundary rather than in the middle of the work.
