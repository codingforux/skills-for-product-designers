# Wrap up a discovery map

1. **Read** the map and every closed ticket's finding. Done when each Findings so far line is checked against its ticket.
2. **Ask who the readout is for**, in one round: who will act on it, and how much of this they already know. The user sends it; you contact no one.
3. **Write the readout** for those readers, who never saw the map. It is the full record: the user cuts it down for a deck or a message themselves. Show it to the user and iterate until they approve.
   - The **answer** to the destination's question first, in one paragraph.
   - The **findings**: each a one-sentence claim, its evidence (which tickets, how many participants or sources) and its **strength**. **Strong**: several independent sources agree, or behaviour was observed. **Moderate**: a few sources, or reports of behaviour. **Weak**: one source, or opinions about the future. Grade by evidence, not conviction.
   - What surprised, and what is still unknown.
   - The **recommendation**. For a pitch, end on **the ask**: the decision needed, and from whom.
4. **Propose doc updates**: the exact lines for each persona, glossary entry or design system doc the findings change, including changes the interview tickets proposed. Write the ones the user approves now. List the rest in the readout under **Proposed doc updates**, with their exact lines, to apply later.
5. **Save and close.** Save the readout as `<map-slug>.md` in the research folder named in the UX config. In a git repo, commit it with the doc updates on a new branch and open one pull request titled `Discovery: <map title>`; the user merges. Close the map with a comment: the readout's answer, linking the readout.
6. **Hand off.** For a brief, tell the user to run `/to-ux-brief` in this session, with the map as the brief's source. For a pitch, the user sends the readout. Otherwise the readout is the record.
