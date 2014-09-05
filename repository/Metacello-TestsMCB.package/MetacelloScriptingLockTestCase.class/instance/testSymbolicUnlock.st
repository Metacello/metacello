tests
testSymbolicUnlock
  | projectSpec |
  Metacello new
    configuration: 'ExternalX';
    version: #'stable';
    lock.
  self
    assert:
      (Metacello image
        configuration: 'ExternalX';
        list) isEmpty.
  projectSpec := (Metacello registry
    configuration: 'ExternalX';
    list) first.
  self assert: projectSpec registration locked.
  Metacello registry
    configuration: 'ExternalX';
    unlock.
  projectSpec := (Metacello registry
    configuration: 'ExternalX';
    list) first.
  self deny: projectSpec registration locked