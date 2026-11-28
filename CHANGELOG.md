# Changelog

All notable changes to this project will be documented in this file.

## v0.5.0

Features 2 · Changes 1 · Internal 2

### Features

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-comment-dark.svg" /><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-comment-light.svg" /><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-comment-light.png" alt="PR comment" height="18" align="texttop" /></picture> Add a `launch-data` input for preview links, and move to flipbook-cli 0.7.0 for its redesigned preview comment. ([#27](https://github.com/flipbook-labs/deploy-storybook/pull/27))

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-comment-dark.svg" /><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-comment-light.svg" /><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-comment-light.png" alt="PR comment" height="18" align="texttop" /></picture> Add `comment-template` and `assets-dir` inputs for customizing the preview comment and finding its buttons. ([#27](https://github.com/flipbook-labs/deploy-storybook/pull/27))

### Changes

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-docs-dark.svg" /><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-docs-light.svg" /><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-docs-light.png" alt="Docs" height="18" align="texttop" /></picture> Rewrite the README around the Action's setup, inputs, and example workflows. ([#36](https://github.com/flipbook-labs/deploy-storybook/pull/36))

### Internal

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-dark.svg" /><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.svg" /><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.png" alt="Packages" height="18" align="texttop" /></picture> Move to Changewrite v0.16.0 and AgentSkills v0.9.0. ([#36](https://github.com/flipbook-labs/deploy-storybook/pull/36))

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-dark.svg" /><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.svg" /><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.png" alt="Packages" height="18" align="texttop" /></picture> Vendor the shared skills into `.lpm/` on Lute `1.0.1-nightly.20261117`. ([#36](https://github.com/flipbook-labs/deploy-storybook/pull/36))

## v0.4.1

Changes 3 · Dependencies 1 · Internal 2

### Changes

1. <picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-ci-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-ci-light.svg"><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-ci-light.png" alt="CI" height="18" align="texttop"></picture> Require every pull request to include a `.changes/` entry: CI now runs `changewrite check` and fails when no unreleased entry is present. ([#23](https://github.com/flipbook-labs/deploy-storybook/pull/23))
2. <picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-light.svg"><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-light.png" alt="Release" height="18" align="texttop"></picture> Release automation reads the public Flipbook Backend App Client ID from an organization variable. ([#29](https://github.com/flipbook-labs/deploy-storybook/pull/29))
3. <picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.svg"><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.png" alt="Packages" height="18" align="texttop"></picture> Declare the shared skills dev dependency in `pkg.luau` on Lute `1.0.1-nightly.20261115`. ([#31](https://github.com/flipbook-labs/deploy-storybook/pull/31))

<details>
<summary>Dependencies (1)</summary>

1. <picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.svg"><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-packages-light.png" alt="Packages" height="18" align="texttop"></picture> Add AgentSkills `v0.7.0` as a dev dependency so agents can bootstrap the shared skills library. ([#26](https://github.com/flipbook-labs/deploy-storybook/pull/26))

</details>

<details>
<summary>Internal (2)</summary>

1. <picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-light.svg"><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-light.png" alt="Release" height="18" align="texttop"></picture> Upgrade the Changewrite release action to `v0.7.0` and adopt its `publish-lock` check. ([#26](https://github.com/flipbook-labs/deploy-storybook/pull/26))
2. <picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-light.svg"><img src="https://raw.githubusercontent.com/flipbook-labs/deploy-storybook/main/.changes/assets/kind-release-light.png" alt="Release" height="18" align="texttop"></picture> Configure Changewrite kinds so release notes show where each change landed, and collapse the Dependencies and Internal sections. ([#32](https://github.com/flipbook-labs/deploy-storybook/pull/32))

</details>


## v0.4.0

### Changes

- Fix rokit add by trusting flipbook-cli first (#19) ([4fcfc95](https://github.com/flipbook-labs/deploy-storybook/commit/4fcfc95ca4133f589e730d3ed14383158675cf4c))



## v0.3.2

### Changes

- Fix CI failure from attempting to install flipbook-cli with the trust check (#17) ([49cdc33](https://github.com/flipbook-labs/deploy-storybook/commit/49cdc337f5f07d58896b08d35f0672dbe61eb4a6))



## v0.3.1

### Changes

- Fix Rokit double-authentication when used alongside setup-rokit (#15) ([a448ef4](https://github.com/flipbook-labs/deploy-storybook/commit/a448ef4c97a5ea6aa8d39ac3bfe2345736d0f294))



## v0.3.0

### Changes

- Try and fix the release workflow (#12) ([e31517e](https://github.com/flipbook-labs/deploy-storybook/commit/e31517ef8dec9831565a8d5e30183fe151bb2527))

- Revert "Fix Rokit double-authentication when used alongside setup-rokit" (#11) ([c494878](https://github.com/flipbook-labs/deploy-storybook/commit/c4948787eb67c3fe14729d9c3c19f58dc617ea65))

- Fix Rokit double-authentication when used alongside setup-rokit ([0a1ebf3](https://github.com/flipbook-labs/deploy-storybook/commit/0a1ebf349e38446eac42e4de266a07d995814123))

- Add PR preview comment step (#7) ([47b30bc](https://github.com/flipbook-labs/deploy-storybook/commit/47b30bc8e2650a801c0ba2b50b2d623798e06ff0))



## v0.1.0

### Changes

- Setup release workflow (#2) ([c022c9d](https://github.com/flipbook-labs/deploy-storybook/commit/c022c9d0f329a1af80e002ee1d0a975e3300faaf))

- License the repo (#3) ([20a6578](https://github.com/flipbook-labs/deploy-storybook/commit/20a6578534bf936f14e761f302889b628ee7d9e1))

- Add Flipbook storybook deploy action (#1) ([8d46a13](https://github.com/flipbook-labs/deploy-storybook/commit/8d46a132dd9b998b8de40a8cdcb91af4c61cc397))

- First commit ([60f8cc3](https://github.com/flipbook-labs/deploy-storybook/commit/60f8cc3b225e21eb7b98fe721ec99598b8518720))
