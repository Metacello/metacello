tests
testFileTreeLoadGithubRefBaseline8
  "BaselineOfExternal reference from github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository using #baseline:with:"

  Metacello new
    baseline: 'GithubRefVIII';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    get.
  Metacello new
    baseline: 'GithubRefVIII';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfGithubRefVIII'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'filetree://' , externalDirectory fullName.
  self
    verify: 'External-Core'
    loadedFrom:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'