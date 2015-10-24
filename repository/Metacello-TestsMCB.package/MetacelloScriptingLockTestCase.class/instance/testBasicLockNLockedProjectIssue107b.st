tests
testBasicLockNLockedProjectIssue107b
  | sawLockWarning |
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    lock.
  sawLockWarning := false.
  Metacello new
    configuration: 'LockConfigurations';
    version: '1.4.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    onLock: [ :ex | ex honor ];
    load.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'dictionary://Metacello_Config_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil