tests
testLockCommandReference1
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    get;
    lock;
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration currentVersionString = '1ac5850'.
  self assert: projectSpec registration locked