tests
testConflict2
    "Conflict must show up in a configuration loaded from a project spec"

    self testFileTreeLoadConfigurationVersion.
    [ 
    Metacello new
        project: 'Conflict';
        version: '1.0';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load ]
        on: MetacelloSkippedProjectSpecLoadUpgradeNotAllowedNotification
        do: [ :ex | ex useNewProjectRegistration ].
    self
        validate: 'Conflict'
        registrySize: 2
        expectedConfigurationVersion: '1.0'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: nil
        expectedBaselineRepository: nil.
    self
        validate: 'ExternalX'
        registrySize: 2
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'dictionary://Metacello_Conflict_Test_Repository'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'