# Components

How to decide what becomes a component and how to build it as a Figma component. A pattern's shell, when built, follows the same rules.

## When to extract

Extract when a repeated build has a **job** and a **future**:

- It appears **three or more times** in the shipped frames, built the same way, or
- It appears twice and the brief's roadmap or the user says it will recur.

Leave a one-off as a frame. A component nobody reuses is upkeep with no return.

Before building anything new, look for a **home** in what exists, in this order:

1. A library component that already does the job: swap or reattach to it.
2. A library component missing a variant or property: a **library proposal** for its owner.
3. A local component in this file: add the variant or property to it.

Build a new component only when none fits, **local** to this file. It becomes a library proposal only when other teams or product areas need it too.

## Detached instances

A detached instance is evidence: someone needed something the component couldn't do. Find them through each frame's `detachedInfo`, which names the source component. Group them by source and read what changed after detaching:

- **Changed what an override could have changed** (text, an icon swap, a token-bound colour, a hidden layer): **reattach**, and reapply the change as an override.
- **The same change across several detaches**: the component is missing a variant, property or slot. A library proposal if it's a library component, or an edit to the local component if it's this file's. The most-detached components are the first to fix.
- **A real one-off**: leave it detached, with a note on the frame saying why, as `FIGMA_STANDARDS.md` asks.

## Building the API

Mirror the code component when one exists (Code Connect names it): the same properties, names and values, so a designer and an engineer talk about the same component in the same words. Keep common needs as properties; solve uncommon needs by composition.

- **Variants** only for combinations that must look different on the canvas: `State` (default, hover, pressed, disabled, error), `Size`, `Type`. Each variant property is one axis. When combinations pass what a person can scan, move an axis to a property or split the component.
- **A `Breakpoint` variant**, sparingly: only when the component's structure changes between breakpoints (a nav that collapses into a menu, a table that becomes stacked cards), and only for the breakpoints where it does, named as in `FIGMA_STANDARDS.md`. A component that only gets wider or narrower takes auto layout and resizing instead.
- **Boolean properties** to show or hide an optional part: a leading icon, helper text, a close button. A boolean often halves a variant set.
- **Text properties** for every string a designer changes, named like the layer they drive.
- **Instance swap properties** for one fixed-size part chosen from a set: an icon, an avatar, a trailing control. Set preferred values so the swap menu shows the right ones.
- **Nested components** for parts with their own job and states (a button inside a card). Build them first, then compose.

Avoid the **supercomponent**: a component that grows a property for every variation it has met. When a component needs a property per case, the cases want composition: a slot, or separate components.

## Slots

A **slot** is an area inside a component where a designer places any content while the component keeps its frame, padding, radius and actions. Slots get unwieldy fast, so properties are the default and a slot is the exception: earned by evidence, and always **tight**.

A slot is earned only when the shipped frames show one of these:

- **Repeating items** of one kind: tabs in a tab bar, checkboxes in a group, actions in an alert, rows in a list or menu. Here a slot replaces "count" variants, pre-placed hidden layers and stacks of instance swaps, which are composition disguised as configuration.
- A **container** (card, modal, sheet, panel) detached again and again just to change its body, where no closed set of variants or properties covers what the frames hold.

Everything else takes properties, above all components whose content is their **contract**: a button's label and icon, an input's label, value and helper text, a chip, a tag. A code component that takes children doesn't by itself justify a slot.

Every slot is **tight**. A slot missing any of these is not ready to build:

- **One job**, named for what goes in it (`tabs`, `actions`, `rows`), never `children`, `content` or `slot`.
- **Preferred only**: a short list of preferred instances, the components the frames actually put there, with "allow preferred only" on.
- **Counts**: a minimum and a maximum taken from the shipped frames (a tab bar that ships with 2 to 5 tabs gets 2 and 5).
- **Fixed layout**: direction, spacing and alignment set in the main component, so instances change what's in the slot, never how it sits.
- **Described**: the component's description lists what the slot accepts and its counts, since Figma warns on a broken limit but doesn't block it.
- **One slot per component** unless the frames prove two, and never a slot inside a slot.

Each slot gets its own plan entry, with its evidence and these parameters. When unsure, build properties: deleting a slot later wipes what every instance put in it.

Building notes:

- A slot can't be the component's top-level layer, and properties don't work on layers inside a slot: put the property on the nested component instead.
- Give an item slot its typical number of default items; give a container slot typical content, or leave it empty when its content varies too much to guess.
- Through the Figma MCP, filling a slot inside an instance can fail. Add content and change existing slot children in separate calls, hide old defaults instead of deleting them, and screenshot after.

## Names and descriptions

- Name components as the library does, in the glossary's words: `<Category> / <Name>`.
- Prefix building blocks designers shouldn't place directly with `.` (for example `.Row base`), so they stay out of the assets panel and out of any publish.
- Give every component a one-line description: its job, when to use it over its nearest sibling, and what its slots accept.
