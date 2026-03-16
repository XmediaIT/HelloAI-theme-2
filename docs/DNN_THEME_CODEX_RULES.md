# DNN_THEME_CODEX_RULES.md

## Preview-first
Work in preview first.
Do not update DNN ASCX files until preview is approved.

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

## Preview images
Use stock images by default for preview blocks unless a specific image is provided.
