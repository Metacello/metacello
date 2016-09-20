tests
testBaselineUnregister
  | projectSpec repo platform |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  Metacello new
    baseline: 'ExternalX';
    repository: repo;
    register.
  Metacello registry
    baseline: 'ExternalX';
    repository: repo;
    unregister.
  projectSpec := Metacello registry
    baseline: 'ExternalX';
    list.
  self assert: projectSpec isEmpty