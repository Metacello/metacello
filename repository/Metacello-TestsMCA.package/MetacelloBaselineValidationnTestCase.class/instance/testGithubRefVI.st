tests - valid
testGithubRefVI
  | repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefVI';
    load.
  self validateBaseline: (Smalltalk at: #'BaselineOfGithubRefVI')