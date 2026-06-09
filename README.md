# deploy-storybook

A GitHub Action that deploys a [Flipbook](https://github.com/flipbook-labs/flipbook)
storybook to a Roblox experience via Open Cloud.

It's a thin wrapper around
[`flipbook-cli`](https://github.com/flipbook-labs/flipbook-cli): the action
installs the CLI for you and maps workflow inputs onto its `deploy` command, so
you don't have to install or manage the binary yourself.

## How it installs the CLI

`flipbook-cli` is distributed as a [Rokit](https://github.com/rojo-rbx/rokit)
tool. Rather than asking you to download a release binary by hand, this action:

1. Installs Rokit with [`CompeyDev/setup-rokit`](https://github.com/CompeyDev/setup-rokit).
2. Runs `rokit add --global flipbook-labs/flipbook-cli@<cli-version>`, which puts
   the CLI on `PATH` for the rest of the job — regardless of working directory.

Pinning happens through the `cli-version` input, so deploys stay reproducible.

> **Runner support:** `flipbook-cli` ships binaries for `linux-x86_64` and
> `macos-arm64`. Use `ubuntu-latest` (recommended) or `macos-latest` runners.

## Usage

The CLI deploys a pre-built `.rbxl` place file that contains your storybooks and
stories — build it earlier in the job (e.g. with Rojo) and pass its path as
`place-file`.

```yaml
name: Deploy storybook
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      # ...build your storybook place file (e.g. `rojo build`) into storybook.rbxl...

      - uses: flipbook-labs/deploy-storybook@v1
        with:
          api-key: ${{ secrets.ROBLOX_API_KEY }}
          universe-id: ${{ secrets.ROBLOX_STORYBOOK_UNIVERSE_ID }}
          place-name: Flipbook Stories
          place-file: storybook.rbxl
```

### Per-PR preview deploys

Deploy each pull request to its own named place by setting `place-name`:

```yaml
- uses: flipbook-labs/deploy-storybook@v1
  with:
    api-key: ${{ secrets.ROBLOX_API_KEY }}
    universe-id: ${{ secrets.ROBLOX_STORYBOOK_UNIVERSE_ID }}
    place-name: "Storybook Preview #${{ github.event.number }}"
    place-file: storybook.rbxl
```

If you keep multiple places with the same name, pass an explicit `place-id` to
disambiguate which one to publish to.

## Inputs

| Input           | Required | Default               | Description                                                                                           |
| --------------- | -------- | --------------------- | ----------------------------------------------------------------------------------------------------- |
| `api-key`       | yes      |                       | Roblox Open Cloud API key (passed to the CLI as `ROBLOX_API_KEY`). Pass from a secret.                |
| `universe-id`   | yes      |                       | Universe (experience) ID to deploy to (`--universe-id`).                                              |
| `place-name`    | yes      |                       | Name of the place to update or create (`--place-name`), e.g. `Flipbook Stories` or `Storybook Preview`. |
| `place-file`    | yes      |                       | Path to the built `.rbxl` place file containing your storybooks and stories (`--place-file`).         |
| `place-id`      | no       |                       | Explicit place ID to publish to (`--place-id`); disambiguates same-named places.                      |
| `flipbook-rbxm` | no       |                       | Path to a local `Flipbook.rbxm` runtime (`--flipbook-rbxm`); skips downloading Flipbook from GitHub.  |
| `cli-version`   | no       | `0.5.0`               | `flipbook-cli` version to install (no leading `v`).                                                    |
| `rokit-version` | no       | `v1.2.0`              | Rokit version to install.                                                                              |
| `github-token`  | no       | `${{ github.token }}` | Token used by Rokit to download from GitHub releases and by the CLI to fetch the Flipbook runtime.    |

## Required secrets

Create these in your repository settings and reference them as shown above:

| Secret                         | Description                  |
| ------------------------------ | ---------------------------- |
| `ROBLOX_API_KEY`               | Open Cloud API key           |
| `ROBLOX_STORYBOOK_UNIVERSE_ID` | Universe (experience) ID     |

The API key needs Open Cloud place-publishing access for the target universe.
See the [flipbook-cli README](https://github.com/flipbook-labs/flipbook-cli) for
details on creating the experience and key.
