tests - valid
testGithubRefIX
  | repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefIX';
    load.
  self validateBaseline: (Smalltalk at: #'BaselineOfGithubRefIX')