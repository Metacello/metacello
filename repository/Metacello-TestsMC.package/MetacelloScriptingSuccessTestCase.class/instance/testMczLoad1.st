tests
testMczLoad1
    | loaded |
    Metacello new
        project: 'MetacelloExample';
        version: '1.0';
        repository: 'dictionary://Metacello_MczConfiguration_Test_Repository';
        load.
    self
        validate: 'MetacelloExample'
        registrySize: 1
        expectedConfigurationVersion: '1.0'
        expectedConfigurationRepository: 'dictionary://Metacello_MczConfiguration_Test_Repository'
        expectedBaselineVersion: nil
        expectedBaselineRepository: nil