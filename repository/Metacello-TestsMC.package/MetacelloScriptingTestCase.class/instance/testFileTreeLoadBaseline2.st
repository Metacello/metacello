tests
testFileTreeLoadBaseline2
    Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , externalDirectory fullName;
        get.
    Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    self
        validate: 'ExternalX'
        registrySize: 1
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName