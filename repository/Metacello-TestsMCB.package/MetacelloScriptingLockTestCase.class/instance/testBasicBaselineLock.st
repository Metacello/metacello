tests
testBasicBaselineLock
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    lock.
  self
    assert:
      (Metacello image
        baseline: 'External';
        list) isEmpty.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration locked