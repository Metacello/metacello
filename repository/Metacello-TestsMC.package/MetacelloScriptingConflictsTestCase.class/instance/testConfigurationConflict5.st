tests
testConfigurationConflict5
    "Conflict must show up in a configuration loaded from a project spec ... using onUpgrade:"

    "variant of testFileTreeLoadConfigurationVersionsNotification2"

    | baseName |
    self testFileTreeLoadConfigurationVersion.
    Metacello new
        configuration: 'Conflict';
        version: '1.0';
        repository: 'filetree://' , configurationDirectory fullName;
        onUpgrade: [ :ex :existing | 
                    baseName := existing baseName.
                    ex allow ];
        silently;
        load.
    self assert: baseName = 'ExternalX'.
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
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'dictionary://Metacello_Conflict_Test_Repository'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'