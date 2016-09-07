tests - critical validation errors
testGithubRefVII
  | repo validations |
  repo := MetacelloScriptingResource current externalRepository.
  MetacelloPlatform current
    metacelloLoadPackages: {'BaselineOfGithubRefVII'}
    from: {repo}.
  validations := self
    basicValidateBaseline:
      (MetacelloPlatform current globalNamed: #'BaselineOfGithubRefVII').
  self assert: validations size = 1.
  validations
    detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
    ifNone: [ self assert: false ]