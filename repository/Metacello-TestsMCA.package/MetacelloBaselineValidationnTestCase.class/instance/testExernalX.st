tests - valid
testExernalX
  | repo critical |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfExternalX';
    load.
  self
    validateBaseline:
      (MetacelloPlatform current globalNamed: #'BaselineOfExternalX')