running
testBaselineLockError
  "https://github.com/dalehenrich/metacello-work/issues/181"

  Metacello new
    configuration: 'Issue181';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  Metacello image
    baseline: 'External';
    lock.
  self
    should: [ 
      Metacello new
        configuration: 'Issue181';
        version: '0.9.2';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        onConflict: [ :ex | ex allow ];
        load ]
    raise: MetacelloLockedProjectError