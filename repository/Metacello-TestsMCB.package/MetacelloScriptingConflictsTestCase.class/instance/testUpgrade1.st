tests
testUpgrade1
  self testFileTreeLoadConfigurationVersion.
  Metacello new
    configuration: 'Conflict';
    version: '1.0.0';
    repository: 'filetree://' , configurationDirectory fullName;
    onUpgrade: [ :ex :existing | ex allow ];
    silently;
    load.
  self
    validateExpConfigClassName: 'ConfigurationOfConflict'
    expConfigVersion: '1.0.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validateExpConfigClassName: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'dictionary://Metacello_Conflict_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil