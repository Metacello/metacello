tests
testFileTreeLoadConfigurationVersionsNotification2
    "handle MetacelloSkippedProjectSpecLoadUpgradeNotAllowedNotification not handled ... use existingRegistration (non-default)"

    self testFileTreeLoadConfigurationVersion.
    [ 
    Metacello new
        configuration: 'ExternalX';
        version: '0.9.1';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load ]
        on: MetacelloAllowProjectUpgrade
        do: [ :ex | ex disallow ].
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'