tests
testConfigurationConflict11
  "testConfigurationConflict4 with useIncoming"

  self testFileTreeLoadConfigurationVersions.
  [ 
  Metacello new
    configuration: 'Conflict';
    version: '1.1.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load ]
    on: MetacelloAllowProjectDowngrade
    do: [ :ex | ex useIncoming ].
  self
    validateExpConfigClassName: 'ConfigurationOfConflict'
    expConfigVersion: '1.1.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validateExpConfigClassName: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'dictionary://Metacello_Conflict_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil