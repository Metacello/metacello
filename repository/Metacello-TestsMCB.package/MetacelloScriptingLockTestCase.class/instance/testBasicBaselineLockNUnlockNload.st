tests
testBasicBaselineLockNUnlockNload
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    lock.
  Metacello registry
    baseline: 'External';
    unlock.
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:'
            , MetacelloScriptingResource externalCustomIssue185SHA
            , '/repository';
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration currentVersionString = '29efb3d'.
  self deny: projectSpec registration locked