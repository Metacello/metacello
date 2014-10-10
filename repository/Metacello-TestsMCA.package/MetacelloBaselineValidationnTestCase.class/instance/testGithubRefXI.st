tests - valid
testGithubRefXI
  | repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefXI';
    load.
  self validateBaseline: (Smalltalk at: #'BaselineOfGithubRefXI')