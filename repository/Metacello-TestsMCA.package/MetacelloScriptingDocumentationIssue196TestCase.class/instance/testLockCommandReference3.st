tests
testLockCommandReference3
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#example-project-structure"

  | projectSpec |
  Metacello new
    baseline: 'Example';
    repository: 'github://dalehenrich/example:otto/repository';
    get.
  projectSpec := (Metacello registry
    baseline: 'Example';
    list) first.
  self assert: projectSpec registration locked not