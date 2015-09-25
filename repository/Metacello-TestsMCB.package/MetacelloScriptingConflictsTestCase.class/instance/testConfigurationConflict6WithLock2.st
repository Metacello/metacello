tests
testConfigurationConflict6WithLock2
  | sawLockWarning |
  self testFileTreeLoadConfigurationVersions.
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.1';
    repository: 'filetree://' , configurationDirectory fullName;
    lock.
  sawLockWarning := false.
  Metacello new
    configuration: 'Conflict';
    version: '1.2.0';
    repository: 'filetree://' , configurationDirectory fullName;
    onWarning: [ :ex | 
          sawLockWarning := true.
          ex resume ];
    silently;
    load.
  self assert: sawLockWarning.
  self
    validateExpConfigClassName: 'ConfigurationOfConflict'
    expConfigVersion: '1.2.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validateExpConfigClassName: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil