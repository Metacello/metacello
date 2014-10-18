tests
testIssue234b
  "https://github.com/dalehenrich/metacello-work/issues/234"

  [ 
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:/repository';
    lock.
  Metacello registry
    baseline: 'External';
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self
    assert:
      projectSpec registration currentVersionString
        = MetacelloScriptingResource externalCustomIssue234ShortMasterSHA.
  self assert: projectSpec registration locked ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testIssue234b: ' , ex description.
      ex pass ]