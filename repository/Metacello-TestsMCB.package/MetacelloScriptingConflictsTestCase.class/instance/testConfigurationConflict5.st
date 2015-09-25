tests
testConfigurationConflict5
  "Conflict must show up in a configuration loaded from a project spec ... using onUpgrade:"

  "variant of testFileTreeLoadConfigurationVersionsNotification2"

  | baseName |
  self testFileTreeLoadConfigurationVersion.
  Metacello new
    configuration: 'Conflict';
    version: '1.0.0';
    repository: 'filetree://' , configurationDirectory fullName;
    onUpgrade: [ :ex :existing | 
          baseName := existing baseName.
          ex allow ];
    silently;
    load.
  self assert: baseName = 'ExternalX'.
  self
    validate: 'ConfigurationOfConflict'
    expConfigVersion: '1.0.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'dictionary://Metacello_Conflict_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil