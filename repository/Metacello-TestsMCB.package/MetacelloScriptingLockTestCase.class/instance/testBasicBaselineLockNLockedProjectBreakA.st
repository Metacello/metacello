tests
testBasicBaselineLockNLockedProjectBreakA
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
    onLockBreak;
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration currentVersionString = '29efb3d'.
  self assert: projectSpec registration locked