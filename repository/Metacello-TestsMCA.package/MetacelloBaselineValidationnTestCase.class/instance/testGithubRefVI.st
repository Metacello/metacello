tests - valid
testGithubRefVI
	| repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefVI'}
		from: {repo}.
	self
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfGithubRefVI)