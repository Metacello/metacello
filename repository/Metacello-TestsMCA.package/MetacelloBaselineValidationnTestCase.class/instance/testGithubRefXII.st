tests - critical validation errors
testGithubRefXII
  | repo validations |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefXII';
    load.
  validations := MetacelloToolBox
    validateBaseline: (Metacello current globalNamed: #'BaselineOfGithubRefXII').
  self assert: validations size = 2.
  validations
    detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
    ifNone: [ self assert: false ]