tests
testConfigurationConflict9
  "Conflict must show up in a configuration loaded from a project spec"

  "variant of testConfigurationConflict3"

  | disallowed |
  self testFileTreeLoadConfigurationVersions.
  Metacello new
    configuration: 'Conflict';
    version: '1.1.0';
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
    validate: 'ConfigurationOfConflict'
    expConfigVersion: '1.1.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil