tests
testIssue63f
  "https://github.com/dalehenrich/metacello-work/issues/63"

  Metacello new
    configuration: 'Issue63';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load: 'External-Core'.
  self
    verify: 'External-Core'
    loadedFrom:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'.
  self verifyPackageNotLoaded: 'External-Tests'.
  self
    validate: 'ConfigurationOfIssue63'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'dictionary://Metacello_Configuration_Test_Repository'
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'