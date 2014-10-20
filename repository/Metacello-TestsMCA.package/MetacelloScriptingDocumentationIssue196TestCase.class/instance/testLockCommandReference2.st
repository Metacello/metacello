tests
testLockCommandReference2
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#lock-command"

  [ 
  | projectSpec |
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:master/repository';
    lock.
  projectSpec := (Metacello registry
    project: 'External';
    list) first.
  self assert: projectSpec registration locked ]
    on: Error
    do: [ :ex | 
      "see https://github.com/dalehenrich/metacello-work/issues/303"
      (MetacelloPlatform current
        string: ex description
        includesSubstring: 'SSL error, code: -5')
        ifFalse: [ ex pass ] ]