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
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'