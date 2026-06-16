-- Version source of truth for the release lifecycle.
--
-- This repo ships a GitHub Action, not a Luau package, but flipbook-cli's
-- `release` subcommands (gate, draft, prepare-pr) read and bump the version from
-- the first `version` assignment in loom.config.luau in the current directory.
-- (Keep that phrase free of a literal quoted value: the parser grabs the first
-- such line it sees, so a placeholder here would shadow the real version below.)
-- We keep a minimal config here purely to drive that flow.
--
-- TODO(flipbook-cli): teach the release subcommands to accept an alternate
-- version file so non-Luau consumers like this one don't need a loom.config.luau.
return {
	package = {
		name = "deploy-storybook",
		version = "0.3.1",
	},
}
