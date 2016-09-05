tests - critical validation errors
testGithubRefXX
  | repo validations |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefXX';
    load.
  validations := MetacelloToolBox
    validateBaseline:
      (MetacelloPlatform current globalNamed: #'BaselineOfGithubRefXX').
  self assert: validations size = 1.
  validations
    detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
    ifNone: [ self assert: false ]