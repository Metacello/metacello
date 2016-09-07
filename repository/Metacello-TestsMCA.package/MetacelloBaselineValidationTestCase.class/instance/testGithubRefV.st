tests - valid
testGithubRefV
	| repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefV'}
		from: {repo}.
	self
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfGithubRefV)