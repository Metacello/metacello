tests - valid
testGithubRefXI
	| repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefXI'}
		from: {repo}.
	self
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfGithubRefXI)