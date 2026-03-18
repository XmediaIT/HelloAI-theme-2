# AGENTS.md

## Working model
Use a preview-first workflow.

Start in:
- `frontend/html/*`
- `common/css/*`
- `common/js/*`
- `EasyDNNmegaMenu/*`
- `BlockBuilder/*` when a block is being implemented or updated

Do not update:
- `dnn/skin/*.ascx`
- `dnn/containers/*.ascx`

until preview is reviewed and approved.

## Core rules
- Root namespace: `.EasyDNNTheme_HelloAI-theme-2`
- Use:
  - `common/css/base.sass`
  - `common/css/base.css`
  - `common/css/sass/*.sass`
- Use Bootstrap for layout/grid only
- Use Font Awesome as the default icon system
- Use real local vendor assets already in the repo
- Do not use placeholder vendor files
- No inline styles
- No hardcoded colors outside theme variables/tokens

## Fonts
- Headings: `Josefin Sans`
- Body text: `Source Sans 3`
- For preview HTML, Google Fonts may be loaded directly in `<head>`
- Default font variables must be defined in `_base.sass`

## Menu
- Standard dropdown submenu is the default behavior
- MegaMenu is an optional enhancement
- Keep menu dropdown-first
- Do not replace `edsmm_*` compatible structure with Bootstrap navbar markup

## This starter
This starter intentionally has no initial shell.
Build the shell from scratch from the approved mockup, step by step:
1. desktop header
2. mobile header
3. footer
4. main shell integration
5. blocks one by one

## Preview images
For preview work, use stock images by default for image-based sections and blocks.
These images are temporary and expected to be replaced later.

## BlockBuilder model
Every block must have:
- a definition inside `BlockBuilder/GroupName/GroupName.html`
- a valid marker:
  `<!--BlockTemplate:BlockName-->`
- a matching entry in `BlockBuilder/block-registry.json`

Optional smart metadata:
- `BlockBuilder/GroupName/meta/BlockName.schema.json`
- `BlockBuilder/GroupName/meta/BlockName.defaults.json`
- `BlockBuilder/GroupName/meta/BlockName.ai.json`

`previewFile` is optional.
Binary block preview files are not required.

### Domain-neutral rule
This starter is not tied to a single business vertical.
Do not hardcode automotive, dental, hotel, SaaS, legal, or any other industry into the permanent block contract.

Treat these as separate concerns:
- **block definition** = reusable structure, layout contract, editor hooks, schema, defaults, AI constraints
- **business context** = runtime input such as `industry`, `brandTone`, `targetAudience`, `pageGoal`, `language`

A block defines a content pattern, not a fixed industry.

## Default BlockBuilder generation rules
For every new block:
- root wrapper must include `data-features="margin,padding"`
- if the block has editable background, use `data-features="margin,padding,background"`
- every editable image must use:
  `<img class="edsBB__image ..." alt="..." />`
- every editable Font Awesome icon must use:
  `<span class="edsBB_fontIcon ..."><i class="..."></i></span>`
- use BB hook classes and theme-specific classes together
- every block must have:
  - `<!--BlockTemplate:BlockName-->`
  - `<!--previewheight:NN-->`
  - `block-registry.json` entry

## Strict BlockBuilder block checklist
When generating or updating a BlockBuilder block, always follow this checklist.

### Required block definition
Every block must include:
- a block definition inside `BlockBuilder/GroupName/GroupName.html`
- a valid block marker:
  `<!--BlockTemplate:BlockName-->`
- a preview height marker:
  `<!--previewheight:NN-->`
- one clear root wrapper element
- a matching entry in `BlockBuilder/block-registry.json`

### Root wrapper
- use one main root wrapper per block
- place `data-features="..."` on the root wrapper
- by default use:
  - `data-features="margin,padding"`
- if the block has editable background, use:
  - `data-features="margin,padding,background"`

### Replaceable images
If an image must be replaceable from BlockBuilder UI, use a real `<img>` element with:
- `edsBB__image`
- a theme-specific image class
- an `alt` attribute

Preferred pattern:

```html
<img alt="..." class="edsBB__image my-block__image img-fluid" src="..." />
```

Rules:
- do not rely only on CSS background images for standard BB image replacement
- if a block has multiple replaceable images, every replaceable image must use `edsBB__image`

### Replaceable icons
If a Font Awesome icon must be replaceable from BlockBuilder UI, use:

```html
<span class="edsBB_fontIcon my-block__icon">
  <i class="fa-solid fa-car"></i>
</span>
```

Do not use a bare `<i>` element for an icon that should be editable.

### Smart metadata
If the block is smart-capable:
- `schema.json` defines the content model and structural limits
- `defaults.json` stores neutral default demo content or approved starter defaults
- `ai.json` stores AI generation constraints and allowed runtime context inputs

Do not store a permanent business domain in the block metadata.
Use runtime context instead.

### Content pass rules
A content pass is not a layout task.

When doing a content pass, you may update:
- headings
- paragraphs
- CTA labels
- list items
- card content
- stat labels and values when explicitly intended
- matching `defaults.json` content for the same block

Do not update during a content pass:
- block structure
- BB hook classes
- theme classes
- icon wrapper structure
- DNN shell files
- header, footer, or menu unless explicitly requested

### Definition of done
A block is complete only if it has:
1. `BlockTemplate`
2. `previewheight`
3. one root wrapper
4. correct `data-features`
5. `edsBB__image` on all editable images
6. `edsBB_fontIcon` on all editable Font Awesome icons
7. `block-registry.json` entry
8. preview implementation
9. aligned smart metadata when the block is smart-capable
10. defaults that are not permanently locked to a single industry unless a project explicitly requires it
