tests
testBasicBaselineLock
  | projectSpec repo platform |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  Metacello new
    baseline: 'ExternalX';
    repository: repo;
    lock.
  self
    assert:
      (Metacello image
        baseline: 'ExternalX';
        list) isEmpty.
  projectSpec := (Metacello registry
    baseline: 'ExternalX';
    list) first.
  self assert: projectSpec registration locked