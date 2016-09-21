tests
testBasicBaselineLockNloadNew
  | projectSpec sawWarning |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    lock.
  sawWarning := false.
  [ 
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:'
            , MetacelloScriptingResource externalCustomIssue185SHA
            , '/repository';
    load ]
    on: Warning
    do: [ :ex | 
      sawWarning := true.
      ex resume ].
  self assert: sawWarning.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration currentVersionString = '29efb3d'.
  self assert: projectSpec registration locked.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        =
          {('github://dalehenrich/external:'
            , MetacelloScriptingResource externalCustomIssue185SHA
            , '/repository')}