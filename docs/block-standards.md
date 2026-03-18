# block-standards.md

## Purpose
This theme starter is domain-neutral.
A block must define a reusable content pattern and editor contract, not a permanently fixed business vertical.

Use runtime context for industry-specific generation:
- `industry`
- `brandTone`
- `targetAudience`
- `pageGoal`
- `language`

## Legacy block minimum
Every block must have:
- `BlockBuilder/GroupName/GroupName.html`
- `<!--BlockTemplate:BlockName-->`
- `<!--previewheight:NN-->`
- one clear root wrapper
- entry in `BlockBuilder/block-registry.json`

## Smart-capable block extension
Optional:
- `BlockBuilder/GroupName/meta/BlockName.schema.json`
- `BlockBuilder/GroupName/meta/BlockName.defaults.json`
- `BlockBuilder/GroupName/meta/BlockName.ai.json`

## What a block contains
A complete block can contain up to five layers:
1. **visual layer**: HTML template and theme classes
2. **editor layer**: BlockBuilder hook classes and `data-features`
3. **data layer**: `schema.json`
4. **seed content**: `defaults.json`
5. **AI layer**: `ai.json`

## block-registry.json
Use:
- `BlockBuilder/block-registry.json`

Recommended fields:
- `group`
- `name`
- `type`
- `templateFile`
- `previewFile`
- `smart`
- `meta`

`previewFile` is optional and may be `null`.
Binary block preview files are not required.

## Codex rules for generating BlockBuilder blocks
When generating or updating a BlockBuilder block, always follow these rules.

### 1. Required block wrapper
Every block must have:
- a valid block marker:
  `<!--BlockTemplate:BlockName-->`
- a valid preview height marker:
  `<!--previewheight:NN-->`
- one clear root wrapper element

Preferred root pattern:

```html
<div class="eds_myBlock" data-features="margin,padding">
```

### 2. Root wrapper features
The root wrapper must support:
- margin editing
- padding editing

So by default, the root wrapper should include:

```html
data-features="margin,padding"
```

### 3. Background editing
If the block visually uses a background color, background image, or background overlay, then the root wrapper must also allow background editing.

Use:

```html
data-features="margin,padding,background"
```

Rule:
- no background in the design -> `margin,padding`
- block has editable background -> `margin,padding,background`

### 4. Replaceable images
Every content image inside the block that must be editable from BlockBuilder UI has to use a real `<img>` element with:
- `edsBB__image`
- a theme-specific image class
- an `alt` attribute

Preferred pattern:

```html
<img alt="Descriptive alt text" class="edsBB__image eds_myBlock__image img-fluid" src="..." />
```

Rules:
- do not use a plain `<img>` without `edsBB__image` if the image should be editable
- do not rely only on CSS `background-image` for normal image replacement
- if the block contains multiple editable images, every editable image must use `edsBB__image`

### 5. Replaceable Font Awesome icons
If the block contains Font Awesome icons and those icons should be editable from BlockBuilder UI, wrap them like this:

```html
<span class="edsBB_fontIcon eds_myBlock__icon">
  <i class="fa-solid fa-car"></i>
</span>
```

Rules:
- do not use a bare `<i>` element for an icon that should be editable
- always use `edsBB_fontIcon` for editable icons
- keep a theme-specific class alongside the BB hook class where useful

### 6. Correct HTML markup pattern
Use both:
- BB hook classes for editor support
- theme-specific classes for styling

Preferred pattern:

```html
<div class="eds_myBlock" data-features="margin,padding,background">
  <div class="eds_myBlock__media">
    <img alt="Preview image" class="edsBB__image eds_myBlock__image img-fluid" src="..." />
  </div>

  <div class="eds_myBlock__content">
    <span class="edsBB_fontIcon eds_myBlock__icon">
      <i class="fa-solid fa-star"></i>
    </span>
    <h2 class="eds_myBlock__title">Title</h2>
    <p class="eds_myBlock__text">Text...</p>
  </div>
</div>
```

### 7. Alt attributes
Every editable image must include an `alt` attribute.

### 8. Multiple images rule
If a block has more than one editable image:
- every editable image must use `edsBB__image`

### 9. Smart metadata rule
If the block is smart-capable, also create:
- `schema.json`
- `defaults.json`
- `ai.json`

#### `schema.json`
Use it to define:
- field names
- field types
- arrays vs single values
- min/max item counts
- text-length constraints where useful

#### `defaults.json`
Use it for:
- neutral starter content
- approved reusable demo content
- structure-aligned default values for editor insertion

Do not hardcode a permanent business vertical unless the project explicitly requires a domain-specific starter.

#### `ai.json`
Use it for:
- `mode`, usually `content-only`
- `contentType`
- `contextInputs`
- structure-preservation rules
- text-length constraints
- allowed actions such as `generate_all_content`, `rewrite_section`, `shorten_copy`, `adjust_tone`

Do not use `ai.json` to permanently lock the block to automotive or any other single domain.

### 10. Preview rule
The block should also be implemented in preview where appropriate:
- `frontend/html/home.html`
- or `frontend/html/previews/blocks.html`

### 11. Content pass rule
A content pass is not a redesign.

Allowed changes:
- headings
- body copy
- CTA labels
- checklist items
- cards
- stat text and values when applicable
- matching `defaults.json`

Not allowed unless explicitly requested:
- changing DOM structure
- changing block count or card count if the structure is meant to stay fixed
- changing BB hooks
- removing theme classes
- rewriting unrelated shell parts

### 12. Definition of done for BB-compatible HTML
A generated or updated block is not complete unless:
1. it has `BlockTemplate`
2. it has `previewheight`
3. it has one root wrapper
4. root wrapper supports `margin,padding`
5. background blocks support `background`
6. all editable images use `edsBB__image`
7. all editable FA icons use `edsBB_fontIcon`
8. markup includes theme-specific classes
9. block-registry entry exists
10. preview implementation exists
11. smart metadata matches the actual block structure when used
12. defaults remain domain-neutral unless the project explicitly defines a target domain
