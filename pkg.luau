-- This repo ships a GitHub Action, not a Luau package. This manifest declares
-- the shared skills library that agents read locally, and Changewrite mirrors
-- the release version into it from changewrite.toml.
return {
	package = {
		name = "deploy-storybook",
		version = "0.4.1",
		dev_dependencies = {
			AgentSkills = {
				rev = "v0.7.0",
				sourceKind = "github",
				source = "https://github.com/flipbook-labs/agent-skills",
			},
		},
	},
}
