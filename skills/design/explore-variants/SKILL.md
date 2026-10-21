---
name: explore-variants
description: Make several radically different variants of a design in Figma to answer "what should this look like?". Use when the user wants options or variations for a frame, screen or flow before committing, such as a happy path waiting for review.
---

# Explore Variants

A variant set is **throwaway frames that answer one question**: what should this look like? They sit side by side on one page; the user compares them, picks one (or steals bits from each), and the rest are archived.

The UX folder config should have been provided to you. If not, tell the user to run `/setup-codingforux-skills`.

## Process

### 1. State the question and pick N

Default to **3 variants**. More than 5 stops being radically different and starts being noise, so cap there.

Write the plan in one line, as a text note at the top of the variants page:

> "Three variants of Checkout / Review order, next to the happy path."

### 2. Put them next to the real thing

Variants are much easier to judge when they butt up against the rest of the flow: the real header, real copy, real density. A frame on an empty page hides problems a populated one would expose.

Make a new page in the same file named `Variants / <frame name>`. Duplicate the original frame onto it, plus its neighbours in the flow when they help the comparison. Never edit the original. Build from a blank frame only when there is nothing to start from.

### 3. Generate radically different variants

Draft each variant as its own frame, named `Variant A: <short idea>`. Hold each one to:

- The frame's job and the user stories it serves.
- The library's components and tokens, used as the design system docs say. Call the Skill tool with "figma-writes" before your first write.
- `FIGMA_STANDARDS.md` and the glossary in the UX folder.

Variants must be **structurally different**: different layout, different information hierarchy, different primary action, not just different colours. Three slightly tweaked versions of the same layout aren't variants, they're wallpaper. If two drafts come out too similar, redo one with explicit "do not use <that layout>" guidance.

### 4. Hand it over

Give the user the page link and each variant's one-line idea. The interesting feedback is usually **"the header from B with the summary from C"**, which is the actual design they want. Build that combination when asked.

### 5. Capture the answer and clean up

Once a variant has won:

- Fold the winner into the original frame, so the frame the ticket links to stays the real one. If the user would rather keep the variant frame itself, comment its link on the ticket instead: the latest frame link on a ticket is the one other agents use.
- Comment on the ticket which variant won and why.
- Rename the variants page `Archive / Variants / <frame name>` and leave it in the file. It is the primary source for the decision, kept out of the way. Don't delete it.

## Anti-patterns

- **Variants that differ only in colour or copy.** That's a tweak. Real variants disagree about structure.
- **Detaching components or using raw values to make a variant work.** If the library can't express an idea, say so: that's a finding for the user, not something to hide.
- **Polishing every state.** Default states are enough to judge a direction. The other states come with the tickets later.
- **Editing the original before a variant has won.**
