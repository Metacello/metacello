tests - valid
testGithubRefV
  | repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefV';
    load.
  self
    validateBaseline: (Metacello current globalNamed: #'BaselineOfGithubRefV')