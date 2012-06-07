tests
testConfigurationConflict3
    "Conflict must show up in a configuration loaded from a project spec"

    "variant of testFileTreeLoadConfigurationVersionsNotification3"

    self testFileTreeLoadConfigurationVersions.
    Metacello new
        configuration: 'Conflict';
        version: '1.1';
        repository: 'filetree://' , configurationDirectory fullName;
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
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'