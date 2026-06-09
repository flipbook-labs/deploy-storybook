-- Version source of truth for the release lifecycle.
--
-- This repo ships a GitHub Action, not a Luau package, but flipbook-cli's
-- `release` subcommands (gate, draft, prepare-pr) read and bump the version from
-- the first `version = "..."` line in loom.config.luau in the current directory.
-- We keep a minimal config here purely to drive that flow.
--
-- TODO(flipbook-cli): teach the release subcommands to accept an alternate
-- version file so non-Luau consumers like this one don't need a loom.config.luau.
return {
	package = {
		name = "deploy-storybook",
		version = "0.1.0",
	},
}
