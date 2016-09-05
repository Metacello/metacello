tests - valid
testExernalXXX
  | repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfExternalXXX';
    load.
  self
    validateBaseline:
      (MetacelloPlatform current globalNamed: #'BaselineOfExternalXXX')