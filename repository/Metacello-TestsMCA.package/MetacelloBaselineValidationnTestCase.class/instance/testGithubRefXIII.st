tests - critical validation errors
testGithubRefXIII
  | repo validations |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefXIII';
    load.
  validations := MetacelloToolBox
    validateBaseline: (Smalltalk at: #'BaselineOfGithubRefXIII').
  self assert: validations size = 2.
  validations
    detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
    ifNone: [ self assert: false ]