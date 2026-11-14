# Interview ticket (HITL, two sessions)

The answer is in someone's experience. A **coworker** (sales, support, a PM) sees patterns across many customers, second-hand. A **customer** has it first-hand. The ticket holds the question; it can cover several interviews.

Two sessions, days apart: plan, then synthesize. The ticket stays claimed by the user in between.

## Plan

1. **Ask the user**, in one round: who they will talk to (coworker or customer, which role, how many), how they will reach them, and how long each conversation is.
2. **Write the discussion guide** to pass **the Mom Test**: ask about the person's life and what they did, never about your idea. "Tell me about the last time you…" beats "Would you use…". Ask for specifics over generalities, and phrase every question so it leads nowhere.
   - **Intro**: who the user is, why they're asking, whether it's recorded, and that notes are anonymized.
   - **Warm-up**: their role and a typical day or week.
   - **Three to five topics**, each tied to the ticket's question, with an opener and follow-ups ("What happened next?", "Can you show me?").
   - **Close**: "What should I have asked?" and "Who else should I talk to?"
   - For coworkers, add what customers ask for and complain about most. For several customers, add a short screener.
3. **Post the guide** as a comment on the ticket. Tell the user to run `/explore` on the map with their notes after the conversations.

## Synthesize

1. **Read the notes or transcript** the user brings, pasted or as a path outside the repo. They stay where they are.
2. **Code the participants** P1, P2 and on, each described by role and context only.
3. **Write the findings note**, appending to it as each interview comes in:

   ```markdown
   # <ticket title>

   **Question:** <from the ticket>

   ## Participants

   - P1: <role, context>

   ## Answer

   ## Findings

   1. <finding>
      - P1: "<quote>"

   ## Surprises

   ## Persona changes

   <exact lines to add, proposed>

   ## Follow-ups
   ```

   Keep what people **did** apart from what they say they would do. Strip every quote of names, companies, places and anything else that identifies someone.

4. **Persona changes**: put each one to the user as a question with the exact lines. Save it to the persona file only once they approve.
5. **Resolve** when the user says the round of interviews is done. Done when every topic in the guide is accounted for and every quote is anonymized. Turn Follow-ups into new tickets.
