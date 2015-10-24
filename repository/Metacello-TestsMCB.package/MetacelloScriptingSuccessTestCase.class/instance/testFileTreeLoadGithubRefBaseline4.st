tests
testFileTreeLoadGithubRefBaseline4
  "ConfigurationOfExternal reference from github://dalehenrich/external:configuration/repository using #project:with: with className:"

  Metacello new
    baseline: 'GithubRefIV';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfGithubRefIV'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'filetree://' , externalDirectory fullName.
  self
    verify: 'External-Core'
    loadedFrom:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'.
  self
    validate: 'ConfigurationOfExternal'
    expConfigVersion: '0.9.0'
    expConfigRepo:
      'github://dalehenrich/external:'
        , MetacelloScriptingResource externalConfigurationSHA , '/repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil