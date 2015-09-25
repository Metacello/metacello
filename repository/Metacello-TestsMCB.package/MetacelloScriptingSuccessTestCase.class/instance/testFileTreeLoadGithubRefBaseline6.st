tests
testFileTreeLoadGithubRefBaseline6
  "ConfigurationOfExternal reference from http://ss3.gemstone.com/ss/external.html using #configuration:with:"

  Metacello new
    baseline: 'GithubRefVI';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfGithubRefVI'
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
    expConfigRepo: 'http://ss3.gemtalksystems.com/ss/external'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil