tests
testBasicBaselineLockNUnlockNload
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    lock.
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
  self deny: projectSpec registration locked.
  {projectSpec.
  (projectSpec registration)} inspect.
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