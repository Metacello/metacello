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
    validateExpectedConfigurationClassName: 'ConfigurationOfConflict'
    expectedConfigurationVersion: '1.2.0'
    expectedConfigurationRepository:
      'filetree://' , configurationDirectory fullName
    expectedBaselineClassName: nil
    expectedBaselineVersion: nil
    expectedBaselineRepository: nil.
  self
    validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
    expectedConfigurationVersion: '0.9.1'
    expectedConfigurationRepository:
      'filetree://' , configurationDirectory fullName
    expectedBaselineClassName: nil
    expectedBaselineVersion: nil
    expectedBaselineRepository: nil