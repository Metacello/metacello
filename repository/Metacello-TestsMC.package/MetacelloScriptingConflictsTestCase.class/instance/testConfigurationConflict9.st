tests
testConfigurationConflict9
    "Conflict must show up in a configuration loaded from a project spec"

    "variant of testConfigurationConflict3"

    | disallowed |
    self testFileTreeLoadConfigurationVersions.
    Metacello new
        configuration: 'Conflict';
        version: '1.1';
        repository: 'filetree://' , configurationDirectory fullName;
        silently;
        onDowngrade: [ :ex :existing :new | 
                    existing baseName = 'ExternalX'
                        ifTrue: [ 
                            disallowed := existing baseName.
                            ex disallow ].
                    ex pass ];
        load.
    self assert: disallowed = 'ExternalX'.
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
        expectedConfigurationVersion: '0.9.1'
        expectedConfigurationRepository: 'filetree://' , configurationDirectory fullName
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'dictionary://Metacello_Configuration_Test_Repository'