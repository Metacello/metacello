tests - critical validation errors
testGithubRefVII
  | repo validations |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefVII';
    load.
  validations := MetacelloToolBox
    validateBaseline:
      (MetacelloPlatform current globalNamed: #'BaselineOfGithubRefVII').
  self assert: validations size = 1.
  validations
    detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
    ifNone: [ self assert: false ]