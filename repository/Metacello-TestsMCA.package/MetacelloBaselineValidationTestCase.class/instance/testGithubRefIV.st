tests - valid
testGithubRefIV
	| repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefIV'}
		from: {repo}.
	self
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfGithubRefIV)