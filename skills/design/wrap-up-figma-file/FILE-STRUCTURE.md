# File structure

The target shape for a wrapped-up project file. Adapt it to what the file holds. The test: anyone can find a shipped screen, one of its states, or why a decision was made, without asking.

## Pages

In this order:

1. **Cover**: the product area, the briefs it delivered (links), when it shipped, who designed it, and its status ("Shipped"). Build it as a 1920 by 1080 frame and set it as the file thumbnail.
2. **The shipped flows**, each named in the glossary's words so the name stands alone in search ("Account sign-in", not "Sign-in"). Within a flow, one **section** per screen holding every state of it side by side, left to right: default, empty, loading, error, edge cases, in the order a user meets the screens. Two layouts work; propose one in the plan:
   - **Sections** (the default): one `Shipped` page with a section per flow, its screen sections nested inside, flows stacked top to bottom. The whole product area sits on one canvas, and Dev Mode statuses sit on the flow sections.
   - **Pages**: one page per flow, when there are more flows than fit comfortably on one canvas or the page gets slow to load (roughly past six flows or a few hundred frames). Figma loads pages one at a time, so big files stay fast.
3. **Components**: the components this file owns (see COMPONENTS.md), in sections by category.
4. **Patterns**: one section per pattern, holding its reference example built from instances, a line on the problem it solves and when to use it, and links to the screens that use it.
5. **Archive**: everything explored and not shipped, in sections named after what each explored, with one line on why it lost. The archive is how a dropped idea is found again, so keep the reason.

Separate the shipped pages from Components, Patterns and Archive with a divider: an empty page named `---`. Leave out pages that end up empty.

## Frames and sections

- Frames are named `<Flow> / <Screen> / <State>` per `FIGMA_STANDARDS.md`.
- The shipped version of a screen lives in its flow's section or page. Older versions move to the Archive; never keep a second copy beside the shipped one.
- Mark each shipped flow's sections **Completed** in Dev Mode. Some plans can't set it: report that and move on.
- Annotations and notes that explain a shipped decision stay beside their frame. Ones about work in progress go to the Archive with what they discuss.
