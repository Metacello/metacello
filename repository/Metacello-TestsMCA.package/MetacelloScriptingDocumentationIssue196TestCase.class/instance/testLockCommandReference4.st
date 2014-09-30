tests
testLockCommandReference4
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#example-project-structure"

  | projectSpec |
  Metacello new
    baseline: 'Alternate';
    repository: 'github://dalehenrich/alternate:otto/repository';
    get.
  projectSpec := (Metacello registry
    baseline: 'Alternate';
    list) first.
  self assert: projectSpec registration locked not