tests
testBasicLockedLoad
    Metacello new
        configuration: 'ExternalX';
        version: '0.9.0';
        repository: 'dictionary://Metacello_Config_Test_Repository';
        lock.
    Metacello registry
        configuration: 'ExternalX';
        load.
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9.0'
        expectedConfigurationRepository: 'dictionary://Metacello_Config_Test_Repository'
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'.
    Metacello registry
        configuration: 'ExternalX';
        version: '0.9.1';
        load.
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'dictionary://Metacello_Config_Test_Repository'
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'