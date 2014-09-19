tests
testBasicBaselineLockNLockedProjectEnforce
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    lock.
  Metacello new
    configuration: 'LockConfigurations';
    version: '1.5.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    onLock: [ :ex | ex honor ];
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration currentVersionString = '1ac5850'.
  self assert: projectSpec registration locked