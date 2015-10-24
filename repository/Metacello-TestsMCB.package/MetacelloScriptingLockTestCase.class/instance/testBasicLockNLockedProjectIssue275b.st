tests
testBasicLockNLockedProjectIssue275b
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    lock.
  Metacello new
    configuration: 'LockConfigurations';
    version: '1.3.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    onLock: [ :ex | ex honor ];
    load.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'dictionary://Metacello_Config_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil