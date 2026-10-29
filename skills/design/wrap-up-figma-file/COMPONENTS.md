# Components

How to decide what becomes a component and how to build it. The aim is a small set of components you keep using and improving every time you return to this part of the product: each with one job, and an API that matches how designers actually vary it.

## When to extract

Extract when the pattern has a **job** and a **future**:

- It appears **three or more times** in the shipped frames, built the same way, or
- It appears twice and the brief's roadmap or the user says it will recur.

Leave a one-off as a frame. A component nobody reuses is upkeep with no return.

Before building anything new, look for a **home** in what exists, in this order:

1. A library component that already does the job: swap or reattach to it.
2. A library component missing a variant or property: a **library proposal** for its owner.
3. A local component in this file: add the variant or property to it.

Build a new component only when none fits. Build it **local** to this file. It becomes a library proposal only when other teams or product areas need it too; the library team decides what joins the library.

## Detached instances

A detached instance is evidence: someone needed something the component couldn't do. Find them through each frame's `detachedInfo`, which names the source component. Group them by source and read what changed after detaching:

- **Changed what an override could have changed** (text, an icon swap, a token-bound colour, a hidden layer): **reattach**, and reapply the change as an override.
- **The same change across several detaches**: the component is missing a variant, property or slot. A library proposal if it's a library component, or an edit to the local component if it's this file's. The most-detached components are the first to fix.
- **A real one-off**: leave it detached, with a note on the frame saying why, as `FIGMA_STANDARDS.md` asks.

## Building the API

Mirror the code component when one exists (Code Connect names it): the same properties, names and values, so a designer and an engineer talk about the same component in the same words. Keep common needs as properties; solve uncommon needs by composition.

- **Variants** only for combinations that must look different on the canvas: `State` (default, hover, pressed, disabled, error), `Size`, `Type`. Each variant property is one axis. When combinations pass what a person can scan, move an axis to a property or split the component.
- **Boolean properties** to show or hide an optional part: a leading icon, helper text, a close button. A boolean often halves a variant set.
- **Text properties** for every string a designer changes, named like the layer they drive.
- **Instance swap properties** for one fixed-size part chosen from a set: an icon, an avatar, a trailing control. Set preferred values so the swap menu shows the right ones.
- **Nested components** for parts with their own job and states (a button inside a card). Build them first, then compose.

Avoid the **supercomponent**: a component that grows a property for every variation it has met. When a component needs a property per case, the cases want composition: a slot, or separate components.

## Slots

A **slot** is an area inside a component where a designer places any content while the component keeps its frame, padding, radius and actions. Instances keep library updates however the slot is filled. A property is a closed choice the component defines.

Use a **slot** when:

- The component is a **container** whose body belongs to the consumer: cards, modals, sheets, panels, page and section layouts. In code these take children.
- It holds **repeating items**: tabs in a tab bar, checkboxes in a group, actions in an alert, rows in a list or menu. A slot replaces "count" variants, pre-placed hidden layers and a stack of instance swaps, which are composition disguised as configuration.
- The shipped frames show the component **detached to change its content**. That is the clearest sign a slot is missing.

Use **properties** when the content is the component's **contract**: a button's label and icon, an input's label, value and helper text, a chip, a tag. A slot there lets anything in, and the consistency the component exists for leaks out. In code these take typed props.

When unsure, ask what the code component takes: children means a slot, typed props means properties. With no code yet, start with properties and open a slot only once the shipped frames show content too varied for a closed set.

Build a slot **constrained first**, then open it up:

- Name it for what goes in it (`items`, `actions`, `body`), never `children` or `slot`.
- Set preferred instances for the expected item types, and minimum and maximum counts for item slots (usually a minimum of 1). These guide, they don't enforce, so write the permitted content in the component's description.
- Give item slots about three default items, and leave a container's body empty or with typical content, by how predictable it is.
- A slot can't be the component's top-level layer, and properties don't work on layers inside a slot: put the property on the nested component instead.
- Through the Figma MCP, filling a slot inside an instance can fail. Add content and change existing slot children in separate calls, hide old defaults instead of deleting them, and screenshot after.

## Names and descriptions

- Name components as the library does, in the glossary's words: `<Category> / <Name>`.
- Prefix building blocks designers shouldn't place directly with `.` (for example `.Row base`), so they stay out of the assets panel and out of any publish.
- Give every component a one-line description: its job, when to use it over its nearest sibling, and what its slots accept.
