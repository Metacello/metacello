tests
testConfigurationConflict2
    "Conflict must show up in a configuration loaded from a project spec"

    "variant of testFileTreeLoadConfigurationVersionsNotification2"

    self testFileTreeLoadConfigurationVersion.
    [ 
    Metacello new
        configuration: 'Conflict';
        version: '1.0';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        load ]
        on: MetacelloAllowProjectUpgrade
        do: [ :ex | ex allow ].
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfConflict'
        expectedConfigurationVersion: '1.0'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineClassName: nil
        expectedBaselineVersion: nil
        expectedBaselineRepository: nil.
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'dictionary://Metacello_Conflict_Test_Repository'
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'