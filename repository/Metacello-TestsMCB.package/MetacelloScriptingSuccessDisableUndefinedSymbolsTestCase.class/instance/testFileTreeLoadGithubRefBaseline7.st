tests
testFileTreeLoadGithubRefBaseline7
  "BaselineOfExternal reference from http://ss3.gemstone.com/ss/external.html using #baseline:with:"

  Metacello new
    baseline: 'GithubRefVII';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfGithubRefVII'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'filetree://' , externalDirectory fullName.
  self
    verify: 'External-Core'
    loadedFrom: 'http://ss3.gemtalksystems.com/ss/external'.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'http://ss3.gemtalksystems.com/ss/external'