tests - critical validation errors
testGithubRefVIII
	| repo validations |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefVIII'}
		from: {repo}.
	validations := MetacelloToolBox
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfGithubRefVIII).
	self assert: validations size = 1.
	validations
		detect:
			[ :validation | validation reasonCode == #missingRecommendedProjectSpecField ]
		ifNone: [ self assert: false ]