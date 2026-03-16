# AGENTS.md

## Working model
Use a preview-first workflow.

Start in:
- `frontend/html/*`
- `common/css/*`
- `common/js/*`
- `EasyDNNmegaMenu/*`
- `BlockBuilder/*` only when a block is being implemented

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

## BlockBuilder
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

## Preview images
For preview work, use stock images by default for image-based sections and blocks.
These images are temporary and expected to be replaced later.

## This starter
This starter intentionally has no initial shell.
Build the shell from scratch from the approved mockup, step by step:
1. desktop header
2. mobile header
3. footer
4. main shell integration
5. blocks one by one
