tests - critical validation errors
testGithubRefXX
	| repo validations |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefXX'}
		from: {repo}.
	validations := MetacelloToolBox
		validateBaseline: (MetacelloPlatform current globalNamed: #BaselineOfGithubRefXX).
	self assert: validations size = 1.
	validations
		detect:
			[ :validation | validation reasonCode == #missingRecommendedProjectSpecField ]
		ifNone: [ self assert: false ]