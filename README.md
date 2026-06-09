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

## Setup

### 1. Create the storybook preview experience

1. Navigate to the [Creator Hub](https://create.roblox.com/dashboard/creations) and create a new experience.
2. Give it a name and publish it.

   ![Save Experience dialog](docs/save-experience.png)

3. Copy the **UniverseId** and **PlaceId** — you'll need them later.
4. Close out of the experience in Studio to avoid "Conflict" errors during deploys.
5. Navigate to the start place and enable **Direct Access Control > Fully Open**. This is what enables stable, PR-scoped URLs for each deployment.

   ![Direct Access Control settings](docs/direct-access-control.png)

### 2. Create an Open Cloud API key

1. Go to [https://create.roblox.com/dashboard/credentials](https://create.roblox.com/dashboard/credentials).
2. Click **Create API Key** and give it a name tied to the experience.
3. Optionally restrict it to that specific experience to reduce blast radius.
4. Grant it place-publishing access.

   ![API key permissions](docs/api-key-permissions.png)
5. Generate the key and store it somewhere safe.

### 3. Add secrets to your GitHub repository

In your repository's **Settings > Environments** (or **Secrets and variables > Actions**):

| Name | Type | Value |
| ---- | ---- | ----- |
| `ROBLOX_API_KEY` | Secret | The Open Cloud API key from step 2 |
| `STORYBOOK_UNIVERSE_ID` | Variable | The UniverseId from step 1 |

### 4. Add the workflow

See [Usage](#usage) below.

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
See [Setup](#setup) above for step-by-step instructions.

## Releasing

This action's own releases are automated with
[flipbook-cli](https://github.com/flipbook-labs/flipbook-cli)'s release
lifecycle, consumed as a Rokit tool (see [`rokit.toml`](rokit.toml)). The version
in [`loom.config.luau`](loom.config.luau) is the source of truth.

There are two workflows:

- **[`release-readiness.yml`](.github/workflows/release-readiness.yml)** runs on
  every push to `main`. It runs `flipbook-cli release gate` to decide whether to
  publish, and:
  - If the current version is untagged (a publish PR was merged), it tags the
    commit and opens a **draft** GitHub release (`release draft`).
  - It opens an `[AUTO-GENERATED] Publish vX.Y.Z` PR (`release prepare-pr` +
    [`peter-evans/create-pull-request`](https://github.com/peter-evans/create-pull-request))
    that bumps the version and regenerates `CHANGELOG.md` (via
    [git-cliff](https://github.com/orhun/git-cliff), configured in
    [`cliff.toml`](cliff.toml)).

  Merging that publish PR releases the version and prepares the next one.

- **[`release.yml`](.github/workflows/release.yml)** runs when a drafted release
  is **published**. Since a GitHub Action is consumed from a git ref, "deploying"
  means moving the major-version pointer tag: it force-updates `vMAJOR` (e.g.
  `v1`) to the released commit so consumers pinning
  `uses: flipbook-labs/deploy-storybook@v1` get the latest `v1.x.y`.

### Day-to-day

1. Merge feature PRs into `main`. Each push refreshes the open
   `[AUTO-GENERATED] Publish vX.Y.Z` PR.
2. When ready to ship, merge that publish PR. The next push to `main` drafts the
   GitHub release for the new tag.
3. Review the draft release and click **Publish**. `release.yml` then advances
   the `vMAJOR` pointer tag.

### How this deviates from flipbook-cli's own release flow

- **No build or artifact attach.** flipbook-cli builds per-platform binaries and
  attaches them to the release. An action is consumed straight from the repo, so
  the `build`/`attach` jobs and `release attach` step are dropped.
- **`loom.config.luau` is a shim.** flipbook-cli's `release` subcommands read and
  bump the first `version = "..."` line in `loom.config.luau`. This repo is not a
  Luau package, so it keeps a minimal config purely to drive the version flow.
- **"Deploy" = move the major tag.** flipbook-cli publishes its plugin to the
  Roblox Creator Store on `release: published`; here that hook advances the
  `vMAJOR` pointer tag instead.

### Requirements

- `flipbook-cli@0.5.0` (published) and `git-cliff@2.13.1`, installed via Rokit
  (see [`rokit.toml`](rokit.toml)).
- The `FLIPBOOK_BACKEND_APP_ID` and `FLIPBOOK_BACKEND_APP_PRIVATE_KEY`
  organization secrets — the GitHub App used to open the publish PR so it triggers
  CI. These are inherited from the `flipbook-labs` org, so no per-repo setup is
  needed.
