tests
testLockCommandReference2
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#lock-command"

  | projectSpec |
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:master/repository';
    lock.
  projectSpec := (Metacello registry
    project: 'External';
    list) first.
  self assert: projectSpec registration locked