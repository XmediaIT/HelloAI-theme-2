# block-standards.md

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
Every content image inside the block must be replaceable from BlockBuilder UI.

Use a real `<img>` element with:
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

### 10. Preview rule
The block should also be implemented in preview where appropriate:
- `frontend/html/home.html`
- or `frontend/html/previews/blocks.html`

### 11. Definition of done for BB-compatible HTML
A generated block is not complete unless:
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
