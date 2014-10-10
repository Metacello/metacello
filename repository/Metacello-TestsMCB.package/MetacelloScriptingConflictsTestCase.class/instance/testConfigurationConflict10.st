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
    validateExpectedConfigurationClassName: 'ConfigurationOfConflict'
    expectedConfigurationVersion: '1.0.0'
    expectedConfigurationRepository:
      'filetree://' , configurationDirectory fullName
    expectedBaselineClassName: nil
    expectedBaselineVersion: nil
    expectedBaselineRepository: nil.
  self
    validateExpectedConfigurationClassName: 'ConfigurationOfExternalX'
    expectedConfigurationVersion: '0.9.0'
    expectedConfigurationRepository:
      'filetree://' , configurationDirectory fullName
    expectedBaselineClassName: nil
    expectedBaselineVersion: nil
    expectedBaselineRepository: nil