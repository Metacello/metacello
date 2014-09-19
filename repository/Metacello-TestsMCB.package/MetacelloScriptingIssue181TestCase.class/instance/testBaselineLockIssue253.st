running
testBaselineLockIssue253
  "https://github.com/dalehenrich/metacello-work/issues/253"

  | lockSeen |
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:1ac58502ade7814e1590f71d615cca434b1a4fd5/repository';
    lock.
  lockSeen := false.
  Metacello new
    configuration: 'Issue181';
    version: '0.9.2';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    onLock: [ :ex | 
          lockSeen := true.
          ex honor ];
    silently;
    load.
  self assert: lockSeen