# Contributing to DeployStorybook

## Setup

DeployStorybook uses [Rokit](https://github.com/rojo-rbx/rokit) for toolchain management.

```sh
rokit install
lute pkg install --vendor
```

`rokit install` puts `lute`, `luau-lsp`, `stylua`, and `selene` on your PATH. `lute pkg install --vendor` copies the dev dependencies into `.lpm/`, including the shared agent-skills library that [AGENTS.md](AGENTS.md) routes agents to.

## Changes

The action has no build step. Changes take effect through the composite steps in [`action.yml`](action.yml).

Each user-facing pull request adds one entry under `.changes/`, as described in [`.changes/README.md`](.changes/README.md). Changewrite cuts releases from those entries.
