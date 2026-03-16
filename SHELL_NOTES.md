# SHELL_NOTES.md

## Extracted shell source
This starter uses `Resource-Skin/home.ascx` as the shell reference.

## What was extracted

### Header shell
Kept wrappers/classes:
- `.eds_header`
- `.eds_header1`
- `.eds__fixedHeader`
- `.eds__headerHeight`
- `.eds_headerTools`
- `.eds_headerLeftWrapper`
- `.eds_logo`
- `.eds_headerRightPane`
- `.eds_headerMenu`
- `.eds_logo2`
- `.eds_mobileModal`
- `.responsAbilityMenu`
- `.eds_fixedLogo`
- `.raMenuWrapper`

### Menu shell
Kept as preview shell:
- `raMenuWrapper`
- `responsAbilityMenu`
- `eds_fixedLogo`
- `edsmm_*` compatible preview structure

### Main shell
Only a simplified `.eds_main` wrapper is kept for preview.
The large DNN pane matrix is intentionally not carried into the preview shell.

### Footer shell
Kept wrappers/classes:
- `.eds_footer`
- `.eds_footerTop`
- `.eds_footerLogo`
- `.eds_footerPane`
- `.eds_termsPrivacyBg`
- `.eds_termsPrivacy`

## Preview conversions
- `dnn:LOGO` -> `<img>`
- `dnn:SEARCH` -> simple preview search form
- `dnn:LOGIN` / `dnn:USER` -> static account UI
- `MegaMenu:MENU` -> static preview menu HTML
- footer DNN objects -> static links/text

## Rule for Codex
Do not rebuild the shell from scratch.
Use `frontend/html/home.html` as the canonical preview shell and extend it.
