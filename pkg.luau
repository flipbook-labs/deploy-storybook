-- This repo ships a GitHub Action, not a Luau package. This manifest declares
-- the shared skills library that agents read locally, and Changewrite mirrors
-- the release version into it from changewrite.luau.
return {
	package = {
		name = "deploy-storybook",
		version = "0.5.0",
		dev_dependencies = {
			["agent-skills"] = {
				rev = "v0.9.0",
				sourceKind = "github",
				source = "https://github.com/flipbook-labs/agent-skills",
			},
		},
	},
}
