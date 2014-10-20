tests
testLockCommandReference6
  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#lock-the-projects"

  "https://github.com/dalehenrich/metacello-work/blob/dev/docs/LockCommandReference.md#load-the-example"

  self setupDocumentationRepositories.
  Metacello new
    baseline: 'Alternate';
    repository: 'filetree://' , alternateDirectory fullName;
    lock.
  Metacello new
    baseline: 'External';
    repository: 'filetree://' , externalDirectory fullName;
    lock.
  Metacello new
    baseline: 'Sample';
    repository: 'filetree://' , sampleDirectory fullName;
    lock.
  Metacello new
    baseline: 'Example';
    repository: 'github://dalehenrich/example:otto/repository';
    onLock: [ :ex | ex honor ];
    get;
    load: 'Tests'