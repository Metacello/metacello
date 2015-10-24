tests
testGithubRefBaselineLoad1
  "loading 'Core' group only"

  Metacello new
    baseline: 'GithubRefXII';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load: 'External Core'.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfGithubRefXII'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'filetree://' , externalDirectory fullName.
  self
    verify: 'External-Core'
    loadedFrom:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'.
  self verifyPackageNotLoaded: 'External-Tests'.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'