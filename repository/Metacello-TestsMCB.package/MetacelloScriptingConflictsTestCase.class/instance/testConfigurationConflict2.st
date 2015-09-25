tests
testConfigurationConflict2
  "disallow upgrade (non-default)"

  "variant of testFileTreeLoadConfigurationVersionsNotification2"

  self testFileTreeLoadConfigurationVersion.
  [ 
  Metacello new
    configuration: 'Conflict';
    version: '1.0.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    onConflict: [ :ex | ex disallow ];
    load ]
    on: MetacelloAllowProjectUpgrade
    do: [ :ex | ex disallow ].
  self
    validateExpConfigClassName: 'ConfigurationOfConflict'
    expConfigVersion: '1.0.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validateExpConfigClassName: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil