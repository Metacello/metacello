tests
testIssue234c
  "https://github.com/dalehenrich/metacello-work/issues/234"

  | projectSpec |
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:issue\\234/repository';
    lock.
  Metacello registry
    baseline: 'External';
    load.
  projectSpec := (Metacello registry
    baseline: 'External';
    list) first.
  self assert: projectSpec registration currentVersionString = '6f0ba00'.
  self assert: projectSpec registration locked