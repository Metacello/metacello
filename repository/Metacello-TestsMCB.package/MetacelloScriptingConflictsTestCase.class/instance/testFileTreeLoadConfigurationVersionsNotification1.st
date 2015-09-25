tests
testFileTreeLoadConfigurationVersionsNotification1
  "MetacelloSkippedProjectSpecLoadUpgradeNotAllowedNotification not handled ... default action is to use existingRegistration"

  self testFileTreeLoadConfigurationVersion.
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.1';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load.
  self
    validateExpConfigClassName: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil