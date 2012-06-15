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
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'