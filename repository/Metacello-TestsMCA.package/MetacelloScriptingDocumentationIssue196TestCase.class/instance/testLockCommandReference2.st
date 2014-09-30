tests
testLockCommandReference2
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    get.
  Metacello registry
    baseline: 'External';
    onLock: [ :ex | ex honor ];
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration currentVersionString = '1ac5850'.
  self assert: projectSpec registration locked not