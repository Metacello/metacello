tests
testFileTreeLoadConfiguration1
    Metacello new
        project: 'ExternalX';
        className: 'ConfigurationOfExternalX';
        version: '0.9';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load.
    self
        validate: 'ExternalX'
        registrySize: 1
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'