*metacello-gemstone-testsmcb
testLoadConfigurationThenUnload
  "Load project from configuration, then unload configuration class"

  | specs |
  Metacello new
    configuration: 'External';
    version: '0.9.0';
    repository: 'filetree://' , externalDirectory fullName;
    load.
  self validateConfiguration: MetacelloProjectRegistration registry.
  self unloadPackage: 'ConfigurationOfExternal'.
  specs := Metacello image
    project: [ :spec | spec name = 'External' ];
    list.
  self assert: specs isEmpty