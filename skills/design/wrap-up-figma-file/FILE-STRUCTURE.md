# File structure

The target shape for a wrapped-up project file. Adapt it to what the file holds. The test: anyone can find a shipped screen, one of its states, or why a decision was made, without asking.

## Pages

In this order:

1. **Cover**: the product area, the briefs it delivered (links), when it shipped, who designed it, and its status ("Shipped"). Build it as a 1920 by 1080 frame and set it as the file thumbnail.
2. **One page per shipped flow**, named in the glossary's words so the name stands alone in search ("Account sign-in", not "Sign-in"). Inside each, one **section** per screen holding every state of it side by side, left to right: default, empty, loading, error, edge cases. Order the sections in the order a user meets them.
3. **Components**: the components this file owns (see COMPONENTS.md), in sections by category.
4. **Patterns**: one section per pattern, holding its reference example built from instances, a line on the problem it solves and when to use it, and links to the screens that use it.
5. **Archive**: everything explored and not shipped, in sections named after what each explored, with one line on why it lost. The archive is how a dropped idea is found again, so keep the reason.

Separate the shipped pages from Components, Patterns and Archive with a divider: an empty page named `---`. Leave out pages that end up empty.

## Frames and sections

- Frames are named `<Flow> / <Screen> / <State>` per `FIGMA_STANDARDS.md`.
- The shipped version of a screen lives on its flow's page. Older versions move to the Archive; never keep a second copy beside the shipped one.
- Mark each shipped flow's sections **Completed** in Dev Mode. Some plans can't set it: report that and move on.
- Annotations and notes that explain a shipped decision stay beside their frame. Ones about work in progress go to the Archive with what they discuss.
