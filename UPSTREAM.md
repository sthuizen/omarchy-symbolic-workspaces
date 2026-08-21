# Upstream provenance

Symbolic Workspaces is a maintained derivative of Omarchy's first-party
`omarchy.workspaces` bar widget.

- Upstream repository: <https://github.com/basecamp/omarchy>
- Upstream file: `shell/plugins/bar/widgets/Workspaces.qml`
- Baseline commit: [`b83505d`](https://github.com/basecamp/omarchy/commit/b83505d7380bbe0525f56f5dc556c103848d34d5)
- Local package baseline: Omarchy `4.0.0-1`
- License: MIT; see `LICENSE`

## Intentional changes

- Renames the plugin to the user-owned `nlsthzn.workspaces` namespace.
- Replaces workspace numbers 1–5 with configurable symbolic Nerd Font glyphs.
- Draws the active-workspace mark and its symbol together so the current
  workspace remains recognizable.
- Pins widget typography to JetBrainsMono Nerd Font for deterministic glyph
  rendering.

All other behavior remains based on the upstream Workspaces widget. When
rebasing onto a later Omarchy version, review the upstream diff explicitly and
update the baseline recorded above.
