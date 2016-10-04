tests
testBaselinePackageBranches
  | projectSpec repo platform |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  Metacello new
    baseline: 'BranchX';
    repository: repo;
    load.
  self
    assert: (platform globalNamed: 'BranchCoreX') notNil;
    assert: (platform globalNamed: 'BranchCoreX') installedBranch = 'prime'