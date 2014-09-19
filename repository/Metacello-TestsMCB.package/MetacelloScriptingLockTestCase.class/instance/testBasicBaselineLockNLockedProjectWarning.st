tests
testBasicBaselineLockNLockedProjectWarning
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    lock.
  self
    should: [ 
      Metacello new
        configuration: 'LockConfigurations';
        version: '1.5.0';
        repository: 'dictionary://Metacello_Config_Test_Repository';
        load ]
    raise: Warning