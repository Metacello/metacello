tests
testSymbolicLockNUnlockNload
  Metacello new
    configuration: 'ExternalX';
    version: #'stable';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    lock.
  Metacello registry
    configuration: 'ExternalX';
    unlock.
  Metacello registry
    configuration: 'ExternalX';
    version: '0.9.1';
    load.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'dictionary://Metacello_Config_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil