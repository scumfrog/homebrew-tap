# scumfrog/homebrew-tap

Homebrew tap for [Torii](https://usetorii.dev) and other scumfrog tools.

## Use

```bash
brew tap scumfrog/tap
brew install torii
# or in one line:
brew install scumfrog/tap/torii
```

## Formulas

| Formula | What | Source |
|---|---|---|
| `torii` | Torii gateway — the secure proxy between AI clients and MCP servers | [Torii-gateway](https://github.com/scumfrog/Torii-gateway) |

## Updating

This tap's `Formula/torii.rb` is bumped automatically by the
`dawidd6/action-homebrew-bump-formula` workflow in the source repos on every
release tag. To bump manually, edit `version` + the four `sha256` lines and
push.
