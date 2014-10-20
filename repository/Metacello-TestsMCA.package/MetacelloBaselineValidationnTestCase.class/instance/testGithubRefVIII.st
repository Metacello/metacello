tests - critical validation errors
testGithubRefVIII
  | repo validations |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefVIII';
    load.
  validations := MetacelloToolBox
    validateBaseline: (Smalltalk at: #'BaselineOfGithubRefVIII').
  self assert: validations size = 1.
  validations
    detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
    ifNone: [ self assert: false ]