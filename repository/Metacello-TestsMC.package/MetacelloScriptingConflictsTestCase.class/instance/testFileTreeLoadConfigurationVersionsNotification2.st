tests
testFileTreeLoadConfigurationVersionsNotification2
    "handle MetacelloSkippedProjectSpecLoadUpgradeNotAllowedNotification not handled ... use newRegistration"

    self testFileTreeLoadConfigurationVersion.
    [ 
    Metacello new
        project: 'ExternalX';
        version: '0.9.1';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load ]
        on: MetacelloSkippedProjectSpecLoadUpgradeNotAllowedNotification
        do: [ :ex | ex useNewProjectRegistration ].
    self
        validate: 'ExternalX'
        registrySize: 1
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'