tests
testSymbolicLockNLoad
  | projectSpec |
  Metacello new
    configuration: 'ExternalX';
    version: #'stable';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    lock.
  Metacello registry
    configuration: 'ExternalX';
    load.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'dictionary://Metacello_Config_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  projectSpec := (Metacello registry
    configuration: 'ExternalX';
    list) first.
  self assert: projectSpec registration locked.
  self assert: projectSpec versionString = '0.9.0'