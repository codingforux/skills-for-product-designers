# File structure

The target shape for a wrapped-up project file. The test: anyone can find a shipped screen, one of its states, or why a decision was made, without asking.

## Pages

Three blocks: the cover, the seams, and what's shared. A **divider** is an empty page named `---`. Put a double divider between blocks, and a single divider between seams:

```
Cover
---
---
<Seam A>
🧩 <Seam A> components
---
<Seam B>
🧩 <Seam B> components
---
---
🧩 Shared components
📐 Patterns
🗄️ Archive
```

- **Cover**: the product area, the briefs it delivered (links), when it shipped, who designed it, and its status ("Shipped"). Build it as a 1920 by 1080 frame and set it as the file thumbnail.
- **`<Seam>`**: one per seam the user chose, holding the shipped work, named in the glossary's words so the name stands alone in search ("Account sign-in", not "Sign-in"). One **section** per screen holding every state of it side by side, left to right: default, empty, loading, error, edge cases, in the order a user meets the screens.
- **`🧩 <Seam> components`**: the components only this seam uses, in sections by category.
- **`🧩 Shared components`**: the components two or more seams use. If the team already keeps shared components elsewhere (a component file per product area, say), they go there instead. A component in another file reaches the shipped frames only once that file is published, and its owner publishes: list it in the report, and swap the frames once it's out.
- **`📐 Patterns`**: one section per pattern, holding its reference example built from instances, a line on the problem it solves and when to use it, and links to the screens that use it.
- **`🗄️ Archive`**: everything explored and not shipped, in sections named after what each explored, with one line on why it lost. The archive is how a dropped idea is found again, so keep the reason.

Leave out pages that end up empty.

A component lives with the seam that uses it, and moves to `🧩 Shared components` once a second seam uses it. Moving a main component between pages of the same file keeps every instance linked.

## Frames and sections

- The shipped version of a screen lives on its seam's page. Older versions move to the Archive; never keep a second copy beside the shipped one.
- Mark each shipped screen's section **Completed** in Dev Mode. Some plans can't set it: report that and move on.
- Annotations and notes that explain a shipped decision stay beside their frame. Ones about work in progress go to the Archive with what they discuss.
