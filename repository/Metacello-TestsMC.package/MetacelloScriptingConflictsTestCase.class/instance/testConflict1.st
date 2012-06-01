tests
testConflict1
    "Conflict must show up in a configuration loaded from a project spec"

    self testFileTreeLoadConfigurationVersion.
    Metacello new
        project: 'Conflict';
        version: '1.0';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load.
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
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'