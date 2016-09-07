tests - valid
testIssue32
	| repo critical |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfIssue32'}
		from: {repo}.
	self
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfIssue32)