tests
testConfigurationConflict6
  "Conflict must show up in a configuration loaded from a project spec"

  "variant of testFileTreeLoadConfigurationVersionsNotification5"

  "detect and disallow conflict"

  | newVersion existingVersion baseName |
  self testFileTreeLoadConfigurationVersions.
  Metacello new
    configuration: 'Conflict';
    version: '1.2.0';
    repository: 'filetree://' , configurationDirectory fullName;
    onConflict: [ :ex :existing :new | 
          baseName := existing baseName.
          existingVersion := existing configurationProjectSpec versionString.
          newVersion := new configurationProjectSpec versionString.
          ex disallow ];
    silently;
    load.
  self assert: baseName = 'ExternalX'.
  self assert: existingVersion = '0.9.1'.
  self assert: newVersion = '0.9.2'.
  self
    validate: 'ConfigurationOfConflict'
    expConfigVersion: '1.2.0'
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