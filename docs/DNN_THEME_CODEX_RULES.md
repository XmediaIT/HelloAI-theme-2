# DNN_THEME_CODEX_RULES.md

## Preview-first
Work in preview first.
Do not update DNN ASCX files until preview is approved.

Start in:
- `frontend/html/*`
- `common/css/*`
- `common/js/*`
- `EasyDNNmegaMenu/*`
- `BlockBuilder/*` only when implementing or updating a block

Do not update before approval:
- `dnn/skin/*.ascx`
- `dnn/containers/*.ascx`

## CSS
Use:
- `common/css/base.sass`
- `common/css/base.css`
- `common/css/sass/*.sass`

Do not introduce runtime CSS bundle splitting.

## Shell workflow
Build shell from scratch from the provided mockup:
- desktop header first
- mobile header second
- footer third
- main integration fourth

Do not try to build the entire page at once.

## Menu
Dropdown-first.
MegaMenu is optional enhancement only.
Do not replace `edsmm_*` compatible markup with Bootstrap navbar markup.

## Preview images
Use stock images by default for preview blocks unless a specific image is provided.

## Block generation rules
When Codex creates a new block, the output must include:
- preview implementation where appropriate
- BlockBuilder-compatible HTML
- a `block-registry.json` entry
- smart metadata only if needed by the task

Every new block must:
- include `<!--BlockTemplate:BlockName-->`
- include `<!--previewheight:NN-->`
- have one clear root wrapper
- use `data-features="margin,padding"` by default
- use `data-features="margin,padding,background"` only when the background should be editable
- use `edsBB__image` on every editable image
- use `edsBB_fontIcon` on every editable Font Awesome icon
- preserve theme-specific classes next to BlockBuilder hooks

## Domain-neutral AI rule
This theme starter is reusable across industries.
Codex must not permanently encode a specific industry into the reusable block contract.

Use this split:
- **block contract**: structure, schema, defaults, hooks, constraints
- **runtime business context**: `industry`, `brandTone`, `targetAudience`, `pageGoal`, `language`

Industry-specific content belongs to runtime input, not to the base starter block definition.

## Smart metadata rules
If the block is smart-capable, Codex may create:
- `BlockName.schema.json`
- `BlockName.defaults.json`
- `BlockName.ai.json`

Use them like this:
- `schema.json`: content model and structural limits
- `defaults.json`: neutral starter content or approved default content
- `ai.json`: AI generation rules, constraints, and accepted runtime context inputs

## Content pass rules
A content pass is not a layout task.

Codex may update:
- headings
- paragraphs
- CTA labels
- cards
- checklist items
- stat labels and values when requested
- matching `defaults.json` values

Codex must not update during a normal content pass:
- block DOM structure
- BB hook classes
- theme classes
- DNN shell files
- header, footer, or menu unless explicitly requested

## Required output summary
When Codex completes a task, it should return a short summary that includes:
- which files were changed
- which blocks were added or updated
- whether smart metadata was added or updated
- whether the change was preview-only or preview + BlockBuilder
