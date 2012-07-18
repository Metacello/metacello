testing
testBasicLockNLoadErrorConflict
    Metacello new
        configuration: 'ExternalX';
        version: '0.9.0';
        repository: 'dictionary://Metacello_Config_Test_Repository';
        lock.
    self
        should: [ 
            Metacello registry
                configuration: 'ExternalX';
                version: '0.9.1';
                load ]
        raise: MetacelloLockedProjectError