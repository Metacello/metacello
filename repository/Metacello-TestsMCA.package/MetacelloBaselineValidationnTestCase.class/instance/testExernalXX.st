tests - valid
testExernalXX
  | repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfExternalXX';
    load.
  self
    validateBaseline: (Metacello current globalNamed: #'BaselineOfExternalXX')