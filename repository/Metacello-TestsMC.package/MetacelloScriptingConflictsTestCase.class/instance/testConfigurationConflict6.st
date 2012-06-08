tests
testConfigurationConflict6
    "Conflict must show up in a configuration loaded from a project spec"

    "variant of testFileTreeLoadConfigurationVersionsNotification4"

    "effectively a downgrade"

    self testFileTreeLoadConfigurationVersions.
    Metacello new
        configuration: 'Conflict';
        version: '1.1';
        repository: 'filetree://' , configurationDirectory fullName;
        onConflict: [ :ex | ex allow ];
        silently;
        load.
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