tests - critical validation errors
testGithubRefXIII
  | repo validations |
  repo := MetacelloScriptingResource current externalRepository.
  MetacelloPlatform current
    metacelloLoadPackages: {'BaselineOfGithubRefXIII'}
    from: {repo}.
  validations := self
    basicValidateBaseline:
      (MetacelloPlatform current globalNamed: #'BaselineOfGithubRefXIII').
  self assert: validations size = 2.
  validations
    detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
    ifNone: [ self assert: false ]