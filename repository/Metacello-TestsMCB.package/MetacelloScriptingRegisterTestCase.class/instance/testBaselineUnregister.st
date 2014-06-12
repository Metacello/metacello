tests
testBaselineUnregister
  | projectSpec |
  Metacello new
    baseline: 'Sample';
    repository: 'github://dalehenrich/sample:master/repository';
    register.
  Metacello registry
    baseline: 'Sample';
    repository: 'github://dalehenrich/sample:master/repository';
    unregister.
  projectSpec := Metacello registry
    baseline: 'Sample';
    list.
  self assert: projectSpec isEmpty