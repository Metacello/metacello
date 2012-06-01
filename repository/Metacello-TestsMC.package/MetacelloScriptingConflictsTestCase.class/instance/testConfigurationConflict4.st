tests
testConfigurationConflict4
    "Conflict must show up in a configuration loaded from a project spec"

    "variant of testFileTreeLoadConfigurationVersionsNotification4"

    "effectively a downgrade"

    self testFileTreeLoadConfigurationVersions.
    [ 
    Metacello new
        project: 'Conflict';
        version: '1.1';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load ]
        on: MetacelloSkippedProjectSpecLoadConflictsNotification
        do: [ :ex | ex useNewProjectRegistration ].
    self
        validate: 'Conflict'
        registrySize: 2
        expectedConfigurationVersion: '1.1'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: nil
        expectedBaselineRepository: nil.
    self
        validate: 'ExternalX'
        registrySize: 2
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'dictionary://Metacello_Conflict_Test_Repository'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'