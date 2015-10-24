tests
testBasicLockNLockedProjectBreak1
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    lock.
  Metacello new
    configuration: 'LockConfigurations';
    version: '1.1.0';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    onLock: [ :ex | ex allow	"break lock" ];
    load.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'dictionary://Metacello_Config_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil