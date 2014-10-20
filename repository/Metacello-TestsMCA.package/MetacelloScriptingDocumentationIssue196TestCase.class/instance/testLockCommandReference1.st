tests
testLockCommandReference1
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#lock-command"

  | projectSpec |
  Metacello new
    configuration: 'External';
    version: '1.0.0';
    repository: 'github://dalehenrich/external:configuration/repository';
    lock.
  projectSpec := (Metacello registry
    project: 'External';
    list) first.
  self assert: projectSpec registration locked