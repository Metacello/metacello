tests
testConfigurationConflict10
  "testConfigurationConflict2 with useExisting"

  self testFileTreeLoadConfigurationVersion.
  [ 
  Metacello new
    configuration: 'Conflict';
    version: '1.0.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    onConflict: [ :ex | ex useLoaded ];
    load ]
    on: MetacelloAllowProjectUpgrade
    do: [ :ex | ex useLoaded ].
  self
    validate: 'ConfigurationOfConflict'
    expConfigVersion: '1.0.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil