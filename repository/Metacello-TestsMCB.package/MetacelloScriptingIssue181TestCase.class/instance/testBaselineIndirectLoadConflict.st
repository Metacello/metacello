running
testBaselineIndirectLoadConflict
  "https://github.com/dalehenrich/metacello-work/issues/181"

  Metacello new
    configuration: 'Issue181';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  self
    should: [ 
      Metacello new
        configuration: 'Issue181';
        version: '0.9.2';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        silently;
        load ]
    raise: MetacelloConflictingProjectError