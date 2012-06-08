tests
testConfigurationConflict8
    "Conflict must show up in a configuration loaded from a project spec"

    "variant of testFileTreeLoadConfigurationVersionsNotification4"

    "explicitly adowngrade"

    | newVersion existingVersion baseName |
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
        validate: 'Conflict'
        registrySize: 2
        expectedConfigurationVersion: '1.1'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: nil
        expectedBaselineRepository: nil.
    self
        validate: 'ExternalX'
        registrySize: 2
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'dictionary://Metacello_Conflict_Test_Repository'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'