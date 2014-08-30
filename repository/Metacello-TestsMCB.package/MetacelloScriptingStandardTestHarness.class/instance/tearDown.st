running
tearDown
  | finalWorkingCopyList |
  super tearDown.
  self tearDownPackages.
  self tearDownRepositories.
  MetacelloProjectRegistration registry: registry.
  finalWorkingCopyList := (MCWorkingCopy allManagers
    collect: [ :each | each packageName ]) asIdentitySet.
  self assert: (finalWorkingCopyList - initialWorkingCopyList) isEmpty