---
name: discovery
description: Chart your own question (a hunch, research, people to interview) as a map of question tickets on the tracker, work them one at a time, then wrap up with a readout you can send.
disable-model-invocation: true
---

Discovery starts from the user's own question, with no PRD: a hunch to check, how people work, how other products solve a problem. Chart the way from that question to a **destination** as a **map** on the issue tracker, work its **tickets** (each one a question), then write the **readout**.

The UX folder config (issue tracker, labels, paths) should have been provided to you. If not, tell the user to run `/setup-codingforux-skills`.

Discovery ends in **findings and decisions**. A sketch exists to provoke a reaction. When the pull is to design for real, the map has reached its edge: wrap up.

## The map

The map is one issue labelled `ux-discovery`, and its tickets are its children. In the tracker it works like a brief: use the **Brief operations** in `issue-tracker.md` for children, parked questions and blocking, with the map in the brief's place.

The map is an **index**: each finding lives in its ticket, and the map holds its one-line gist and link.

```markdown
## Destination

<the question in the user's words, and which destination answers it>

## Notes

<the personas it's about, the product area if any, standing preferences>

## Findings so far

- [<closed ticket title>](link): <one-line gist>

## Not yet specified

## Out of scope
```

- **Destination** fixes the scope. It is a **brief** the user owns, a **pitch** to someone whose go-ahead they need, **doc updates** (personas, glossary, design system docs), or a **decision** on the question itself, where "not worth doing" counts. When learning moves it, redraw it on the map.
- **Not yet specified** holds the **fog of war**: questions you can tell are coming but can't phrase yet. The test is whether you can state the question precisely now, not whether you can answer it: a sharp question becomes a ticket, even when blocked.
- **Out of scope** holds work beyond the destination. A ticket found to sit there is closed, with one line here saying why.

In everything the user reads, refer to a map or ticket by its **name**: its title, wrapping its link.

## Tickets

A ticket is a child of the map, sized to one session:

```markdown
Type: <type>

## Question

<what this ticket finds out or decides>
```

| Type | Use when | How it resolves |
| --- | --- | --- |
| `research` | A fact lives in public sources: a competitor's site and help docs, reviews, standards | A subagent follows [RESEARCH.md](RESEARCH.md) |
| `pattern-scan` | The question is how other products solve the same problem | A subagent follows [PATTERN-SCAN.md](PATTERN-SCAN.md) |
| `interview` | The answer is in a coworker's or customer's experience | With the user, over two sessions: [INTERVIEW.md](INTERVIEW.md) |
| `task` | Legwork blocks a question: a data pull, an export, getting access | Do it where your tools reach. Otherwise give the user a checklist they can follow in a tool they have never opened, asking for aggregates (counts, rates, top tens). The finding records what was done and the facts later tickets need |
| `sketch` | "What could it look like?" is the question | Make something rough to react to: in Figma, call the Skill tool with "explore-variants"; outside it, a wireframe. The finding is the user's reaction and what it ruled out, linking the sketch |
| `grilling` | Only the user can decide | Grill the user until they confirm an answer. The finding is the decision and its reasons |

A short question someone else can answer in writing is parked as a `needs-alignment` child of the map, for the user to send with `/to-ux-questionnaire`. Choose an interview when you want someone's experience rather than a fact.

- **Grill** in rounds: ask every question whose prerequisites are settled in one round, numbered, each with your recommended answer, then wait. Facts are yours to find (send a subagent and keep asking); decisions are the user's.
- **Claim** a ticket before working it, by assigning it to the user. The **frontier** is the open, unblocked, unclaimed tickets.
- **Resolve** a ticket by posting its **finding** as the closing comment, closing it, and appending its gist to Findings so far. A finding gives the answer first, then the evidence behind each claim.
- **Subagents** take the research and pattern-scan tickets. Brief each with its ticket, its type file, the tracker doc and the Claim, Resolve and anonymity rules here. It reports the gist, and you append it, so one session edits the map.
- **People stay anonymous.** Everything written to the tracker or the repo names a participant by code and role ("P2, office manager at a 20-person firm"), coworkers included. Recordings, transcripts, notes with names and customer records stay where they were made: link to them.

## Chart

The user brings a loose idea.

1. **Name the destination.** Grill the user: what prompted it, who it's about, what they would do with the answer, and which destination fits. Meanwhile a subagent searches the tracker's closed maps and the research folder for past work on the topic. Open `personas/index.md` and the glossary. Done when the user confirms the destination in one line.
2. **Map the frontier.** Grill again, **breadth-first**: fan out across the whole space, surfacing the open questions and the ones takeable now. If the whole thing fits one session, skip the map: stop and ask the user how to proceed.
3. **Create the map**, then the tickets you can state now, then wire blocking in a second pass, since issues need ids before they can reference each other.
4. **Start a subagent** for each research and pattern-scan ticket on the frontier.
5. **Stop**, naming the frontier. Charting resolves nothing else.

## Work

The user brings a map, and optionally a ticket.

1. **Load the map**: its body, not every ticket.
2. **Choose the ticket**: the one the user named, otherwise the first on the frontier. Claim it. An interview ticket already claimed, with a guide posted, is waiting for the user's notes.
3. **Resolve it** as its type says. One ticket with the user per session.
4. **Redraw the map**: turn fog the answer made sharp into tickets, start subagents for new research and pattern-scan tickets, rule out what now sits beyond the destination, and update or close tickets the answer invalidated.
5. With no open tickets left, tell the user the map is ready to wrap up.

## Wrap up

The user brings a map with no open tickets, or asks to wrap up early: then close the open tickets as out of scope once the user confirms. Follow [WRAP-UP.md](WRAP-UP.md).
