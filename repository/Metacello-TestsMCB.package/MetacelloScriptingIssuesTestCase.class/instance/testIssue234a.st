tests
testIssue234a
  "https://github.com/dalehenrich/metacello-work/issues/234"

  [ 
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:issue\/234/repository';
    lock.
  Metacello registry
    baseline: 'External';
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self
    assert:
      (projectSpec registration currentVersionString
        beginsWith: MetacelloScriptingResource externalCustomIssue234ShortSHA).
  self assert: projectSpec registration locked ]
    on: Error
    do: [ :ex | 
      "see https://github.com/dalehenrich/metacello-work/issues/303"
      (MetacelloPlatform current
        string: ex description
        includesSubstring: 'SSL error, code: -5')
        ifFalse: [ ex pass ] ]