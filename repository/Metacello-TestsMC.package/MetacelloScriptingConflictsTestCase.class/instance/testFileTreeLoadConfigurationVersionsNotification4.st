tests
testFileTreeLoadConfigurationVersionsNotification4
    "MetacelloSkippedProjectSpecLoadConflictsNotification not handled ... default action is to use existingRegistration"

    "explicitly a downgrade"

    self testFileTreeLoadConfigurationVersions.
    [ 
    Metacello new
        configuration: 'ExternalX';
        version: '0.9';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load ]
        on: MetacelloAllowProjectDowngrade
        do: [ :ex | ex allow ].
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'