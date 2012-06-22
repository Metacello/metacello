tests
testConfigurationConflict7
    "Conflict must show up in a configuration loaded from a project spec"

    "variant of testFileTreeLoadConfigurationVersionsNotification4"

    "explicitly downgrade"

    | baseName existingVersion newVersion |
    self testFileTreeLoadConfigurationVersions.
    Metacello new
        configuration: 'Conflict';
        version: '1.1';
        repository: 'filetree://' , configurationDirectory fullName;
        onDowngrade: [ :ex :existing :new | 
                    baseName := existing baseName.
                    existingVersion := existing configurationProjectSpec versionString.
                    newVersion := new configurationProjectSpec versionString.
                    ex allow ];
        silently;
        load.
    self assert: baseName = 'ExternalX'.
    self assert: existingVersion = '0.9.1'.
    self assert: newVersion = '0.9'.
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfConflict'
        expectedConfigurationVersion: '1.1'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineClassName: nil
        expectedBaselineVersion: nil
        expectedBaselineRepository: nil.
    self
        validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
        expectedConfigurationVersion: '0.9.0'
        expectedConfigurationRepository: 'dictionary://Metacello_Conflict_Test_Repository'
        expectedBaselineClassName: 'BaselineOfExternalX'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'