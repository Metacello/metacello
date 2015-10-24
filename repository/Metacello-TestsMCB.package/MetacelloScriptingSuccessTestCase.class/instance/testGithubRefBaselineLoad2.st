tests
testGithubRefBaselineLoad2
  "loading 'Core' and 'Tests' groups "

  Metacello new
    baseline: 'GithubRefXII';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load: #('External Core' 'External Tests').
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
  self
    verify: 'External-Tests'
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