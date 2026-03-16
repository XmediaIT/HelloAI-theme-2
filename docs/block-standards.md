# block-standards.md

## Legacy block minimum
Every block must have:
- `BlockBuilder/GroupName/GroupName.html`
- `<!--BlockTemplate:BlockName-->`
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
