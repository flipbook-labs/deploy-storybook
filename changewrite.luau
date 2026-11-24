return {
	categories = { "Features", "Changes", "Fixes", "Dependencies", "Internal" },
	collapsed = { "Dependencies", "Internal" },
	version = {
		current = "0.4.1",
		mirror = {
			{ file = "pkg.luau" },
			{ file = "README.md", pattern = "\n%- uses: flipbook%-labs/deploy%-storybook@v([%d%.]+)" },
			{
				file = "README.md",
				pattern = "\n +%- uses: flipbook%-labs/deploy%-storybook@v([%d%.]+)\n[^\n]*\n[^\n]*\n[^\n]*\n[^\n]*place%-name: Flipbook",
			},
			{
				file = "README.md",
				pattern = '\n +%- uses: flipbook%-labs/deploy%-storybook@v([%d%.]+)\n[^\n]*\n[^\n]*\n[^\n]*\n[^\n]*place%-name: "PR',
			},
		},
	},
	kind = {
		release = { text = "Release", color = "#94606f" },
		ci = { text = "CI", color = "#75659a" },
		comment = { text = "PR comment", color = "#0969da" },
		deploy = { text = "Deploy", color = "#1a7f37" },
		docs = { text = "Docs", color = "#8a5a2b" },
		packages = { text = "Packages", color = "#7a7444" },
		setup = { text = "Setup", color = "#5b5bd6" },
	},
}
