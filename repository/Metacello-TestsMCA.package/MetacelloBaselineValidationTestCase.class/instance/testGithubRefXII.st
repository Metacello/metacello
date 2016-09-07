tests - critical validation errors
testGithubRefXII
	| repo validations |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefXII'}
		from: {repo}.
	validations := MetacelloToolBox
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfGithubRefXII).
	self assert: validations size = 2.
	validations
		detect:
			[ :validation | validation reasonCode == #missingRecommendedProjectSpecField ]
		ifNone: [ self assert: false ]