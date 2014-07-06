*metacello-gemstone-testsmcb
testLoadConfigurationThenBaselineThenUnload
  "Load project from configuration, then unload configuration class"

  | specs |
  Metacello new
    configuration: 'External';
    version: '0.9.0';
    repository: 'filetree://' , externalDirectory fullName;
    load.
  self validateConfiguration: MetacelloProjectRegistration registry.
  Metacello new
    baseline: 'External';
    repository:
        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
            , '/repository';
    load.
  self validateBaseline: MetacelloProjectRegistration registry.
  self unloadPackage: 'ConfigurationOfExternal'.
  self validateBaseline: MetacelloProjectRegistration registry.
  self unloadPackage: 'BaselineOfExternal'.
  specs := Metacello image
    project: [ :spec | spec name = 'External' ];
    list.
  self assert: specs isEmpty