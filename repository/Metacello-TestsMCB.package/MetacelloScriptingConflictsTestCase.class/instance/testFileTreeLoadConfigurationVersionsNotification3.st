tests
testFileTreeLoadConfigurationVersionsNotification3
  "MetacelloSkippedProjectSpecLoadConflictsNotification not handled ... default action is to use existingRegistration"

  self testFileTreeLoadConfigurationVersions.
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil
    expectedBaselineRepository: nil