tests
testBasicBaselineUnlock
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
  self assert: projectSpec registration locked.
  Metacello registry
    baseline: 'External';
    unlock.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self deny: projectSpec registration locked