tests
testSymbolicLockNLockedProjectEnforce1
  Metacello new
    configuration: 'ExternalX';
    version: #'stable';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    lock.
  Metacello new
    configuration: 'LockConfigurations';
    version: '1.1.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    onUpgrade: [ :ex :existing :new | 
          existing baseName = 'ExternalX'
            ifTrue: [ 
              "enforce lock"
              ex disallow ].
          ex pass ];
    load.
  self
    validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
    expectedConfigurationVersion: '0.9.0'
    expectedConfigurationRepository:
      'dictionary://Metacello_Config_Test_Repository'
    expectedBaselineClassName: 'BaselineOfExternalX'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository:
      'dictionary://Metacello_Configuration_Test_Repository'