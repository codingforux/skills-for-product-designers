# Wrap up an exploration

Turn a finished map into a readout, then take the exit its destination names.

1. **Read everything**: the map, every closed ticket with its resolution and every findings note. Done when each Findings so far line has been checked against its note.

2. **Write the readout** as `README.md` in the map's research folder, then show it to the user and iterate until they approve:

   ```markdown
   # <map title>

   **Destination:** <from the map>, **Map:** <link>

   ## Answer

   <the destination's question answered in one paragraph>

   ## Findings

   1. <a claim, in one sentence>
      - **Evidence:** <which notes, how many participants or sources>
      - **Strength:** strong, moderate or weak

   ## Surprises

   ## Still unknown

   ## Recommendation

   <the exit, and why>
   ```

   Grade **strength** by evidence, not conviction. **Strong**: several independent sources agree, or behaviour was observed. **Moderate**: a few sources, or reports of behaviour. **Weak**: one source, or opinions about the future. Every finding cites at least one note.

3. **Take the exit** the user confirms:
   - **A brief you own**: tell the user to run `/to-ux-brief` in this session. The readout is in the conversation, and the map is the brief's source.
   - **A pitch**: draft an issue for the person whose go-ahead you need, with Problem, Evidence (from the readout, linked), Proposed direction, Goals and success metrics, Open questions and The ask (the decision you need, and from whom). Show it to the user before filing.
   - **Doc updates**: propose the exact lines for each persona, glossary entry or design system doc the findings change. Write only the ones the user approves.
   - **A decision**: the readout is the record.

4. **Close the map** with a comment: the readout's Answer, linking the readout. When the findings are on a branch, commit the readout and any doc updates, push, and open one pull request into the default branch titled `Exploration: <map title>`, linking it on the map. Then stop: the user merges.
