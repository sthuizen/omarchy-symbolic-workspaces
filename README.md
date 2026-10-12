# Symbolic Workspaces for Omarchy

An unofficial Omarchy 4 bar widget that gives workspaces 1–5 memorable symbols
and keeps each symbol visible inside the active-workspace indicator.

The symbols are:

| Workspace | Symbol |
|---|---|
| 1 | Fire |
| 2 | Cross |
| 3 | Star |
| 4 | Crown |
| 5 | Anchor |

Additional live workspaces up to 10 retain numeric labels.

## Requirements

- Omarchy 4 or newer with the Quickshell-based `omarchy-shell`
- JetBrainsMono Nerd Font, included by Omarchy

## Install

Once this repository is published, install it with:

```bash
omarchy plugin add https://github.com/sthuizen/omarchy-symbolic-workspaces.git --enable
```

The manifest declares that this plugin was cloned from `omarchy.workspaces`,
so enabling it replaces the stock Workspaces widget in the existing bar
position. Saving files beneath the installed plugin directory hot-reloads it.

## Customize the symbols

Edit `workspaceSymbols` near the top of `Workspaces.qml`. Values are Nerd Font
glyphs keyed by workspace number. Keep the explicit Nerd Font family unless
your replacement font contains every selected glyph.

## Verification

```bash
omarchy plugin validate .
git diff --check
```

## Origin and license

This project is derived from Omarchy's first-party
[`Workspaces.qml`](https://github.com/basecamp/omarchy/blob/quattro/shell/plugins/bar/widgets/Workspaces.qml).
Omarchy is copyright David Heinemeier Hansson and contributors and is licensed
under the MIT License. The upstream notice is retained in `LICENSE`; detailed
provenance and intentional changes are recorded in `UPSTREAM.md` and
`NOTICE.md`.

This is an independent, unofficial plugin and is not endorsed by the Omarchy
project.
