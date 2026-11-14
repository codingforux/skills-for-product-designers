---
name: explore
description: Chart your own design exploration (a hunch, a question, research you want to do) as a map of question tickets on the tracker, work them one at a time, then wrap up with what you found.
disable-model-invocation: true
---

An idea has arrived wrapped in fog: a hunch worth checking, a question about how people work, a pattern you want to compare. Nobody handed you a PRD; you are the one asking. This skill charts the way from that question to a **destination** as a **map** on the issue tracker, works its **tickets** one at a time (each one a question, answered by research, a pattern scan, an interview, a sketch or a decision), and ends with a **readout** of what you found.

Adapted from Matt Pocock's `wayfinder`.

The UX folder config (issue tracker, labels, paths) should have been provided to you. If not, tell the user to run `/setup-codingforux-skills`.

## Learn, then hand off

An exploration produces **findings and decisions**, not finished designs. A sketch exists to provoke a reaction. When the pull is to start designing for real, you have reached the edge of the map: wrap up and take the exit to a brief.

## Destinations

Naming the destination is the first act of charting, and it fixes the scope. It is one of:

- **A brief you own**: the design work is worth doing and you can define it. Exits to `/to-ux-brief`.
- **A pitch**: the work needs someone else's go-ahead, such as a PM or a lead. Exits to a PRD-shaped issue for them.
- **Doc updates**: what you learn changes the personas, the glossary or the design system docs.
- **A decision**: a yes or no on the question itself. "Not worth doing, and here's why" is a destination reached.

When learning moves the destination, redraw it on the map and rule out whatever no longer fits.

## Refer by name

Every map and ticket is an issue, so it has a **name**: its title. In everything the user reads, refer to it by name, with its link riding inside the name, never by a bare number.

## The map

The map is one issue labelled with the `ux-exploration` role from `labels.md`. Its tickets are its children. In the tracker a map works like a brief: use the **Brief operations** in `issue-tracker.md` for children, parked questions and blocking, with the map in the brief's place.

The map is an **index**, not a store. A finding lives in one place, its ticket and findings note; the map gists it in one line and links.

```markdown
## Destination

<the question in the user's words, and which destination answers it: one or two lines every session orients to>

## Notes

<who it's about (personas), the product area if any, the research folder for this map, standing preferences>

## Findings so far

- [<closed ticket title>](link): <one-line gist of the answer>

## Not yet specified

## Out of scope
```

## Tickets

Each ticket is a child of the map. Its body is the question, sized to one session:

```markdown
## Question

<what this ticket finds out or decides>
```

Each ticket carries one type label from `labels.md` (with local markdown, a `Type:` line). The body never states the type: read the label.

A session **claims** a ticket by assigning it to the user, before any work (with local markdown, a `Claimed:` line). An open, unassigned ticket is unclaimed. Blocking uses the tracker's native dependencies, so the tracker shows what's takeable. The **frontier** is the open, unblocked, unclaimed tickets.

| Type | Mode | Use when | Resolve with |
| --- | --- | --- | --- |
| `explore:research` | AFK | A fact lives in public sources: a competitor's site and help docs, articles, reviews, standards | [types/research.md](types/research.md) |
| `explore:pattern-scan` | AFK | The question is how other products solve the same problem, screen by screen | [types/pattern-scan.md](types/pattern-scan.md) |
| `explore:interview` | HITL, two sessions | The answer is in someone's experience: a coworker's or a customer's | [types/interview.md](types/interview.md) |
| `explore:task` | AFK or HITL | Legwork must happen before a question can be answered: a data pull, an export, getting access | [types/task.md](types/task.md) |
| `explore:sketch` | HITL | "What could it look like?" is the question, and a rough concrete thing would sharpen it | [types/sketch.md](types/sketch.md) |
| `explore:grilling` | HITL | A decision only the user can make | [types/grilling.md](types/grilling.md) |
| `needs-alignment` | Waiting | A short question someone else can answer in writing | The user runs `/to-ux-questionnaire` on the map |

Choose an interview over `needs-alignment` when you want someone's experience rather than a fact.

## Findings and privacy

- **Findings notes** go in the research folder named in the UX config, under `<map-slug>/`: one note per resolved ticket as `NN-<ticket-slug>.md`, and the readout as `README.md`. Record the folder in the map's Notes when charting.
- **One branch per map.** When the UX folder is in a git repo, findings go on the branch `explore/<map-slug>`, pushed as each ticket resolves. Wrap-up opens its one pull request.
- **People stay anonymous.** Everything written to the repo or the tracker names a participant by code and role ("P2, office manager at a 20-person firm"), coworkers included. Recordings, transcripts, notes with names and customer records stay where they were made: link to them. Data comes back as aggregates.

## Fog of war

The map is deliberately incomplete. The **fog of war** is the questions you can tell are coming but can't phrase yet, because they hang on answers still open. Write them loosely in **Not yet specified**. The test is whether you can state the question precisely now, not whether you can answer it: a sharp question becomes a ticket, even when blocked. Resolving a ticket clears the fog ahead of it, graduating whatever is now sharp into new tickets.

**Out of scope** is work beyond the destination. It never graduates. When a ticket turns out to sit there, close it and leave one line in **Out of scope** saying why, linking the ticket.

## Modes

Three modes. Never resolve more than one HITL ticket per session; AFK tickets run in parallel subagents.

### Chart

The user brings a loose idea.

1. **Name the destination.** Interview the user in rounds (the format is in [types/grilling.md](types/grilling.md)): what prompted it, who it's about, what they would do with the answer, and which destination fits. Meanwhile a subagent searches the tracker and the research folder for past explorations and briefs on the topic, so this one builds on them. Open `personas/index.md` and the glossary. Done when the user confirms the destination in one line.
2. **Map the frontier.** Grill again, **breadth-first**: fan out across the whole space, surfacing the open questions and the first ones takeable now. If this surfaces no fog (the whole thing fits one session), skip the map: stop and ask the user how to proceed.
3. **Create the map**: Destination and Notes filled in, Findings so far empty, the fog sketched into Not yet specified.
4. **Create the tickets you can specify now**, then wire blocking in a second pass, with real ids, since issues need ids before they can reference each other.
5. **Fire the AFK tickets.** For each research and pattern-scan ticket, start a subagent with its type file and the ticket. Each one claims its ticket, writes its findings note, posts the resolution and closes it, then reports its gist. Append each gist to Findings so far yourself, so only one session edits the map.
6. **Stop.** Name the frontier, by ticket name. Charting resolves nothing by hand.

### Work

The user brings a map. A ticket is optional; without one, you pick.

1. **Load the map**: its body, not every ticket.
2. **Choose the ticket.** Use the one the user named, otherwise the first frontier ticket. Claim it. An interview ticket that is already claimed and has a guide posted is waiting for its synthesis session: take it when the user brings their notes.
3. **Resolve it** as its type file says. Read related or closed tickets when you need them.
4. **Record it**: write the findings note, post a resolution comment (the gist, linking the note), close the ticket and append the gist to Findings so far.
5. **Redraw the map**: graduate any fog the answer made sharp, rule out what now sits beyond the destination, and update or close tickets the answer invalidated.
6. When no open tickets remain, tell the user the map is ready to wrap up, with `/explore` and the map's link.

### Wrap up

The user brings a map with no open tickets, or asks to wrap up early. Close any open tickets as out of scope first, once the user confirms. Then follow [WRAP-UP.md](WRAP-UP.md).
