tests
testBasicBaselineLockNUnlock
  | projectSpec repoExternal repoAlternate platform |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  repoAlternate := 'filetree://'
    , (platform fullNameForDirectory: alternateDirectory).
  Metacello new
    baseline: 'ExternalX';
    repository: repoExternal;
    lock.
  Metacello registry
    baseline: 'ExternalX';
    unlock.
  Metacello registry
    baseline: 'ExternalX';
    load.
  projectSpec := (Metacello registry
    baseline: 'ExternalX';
    list) first.
  self assert: projectSpec repositoryDescriptions asArray = {repoExternal}.
  self deny: projectSpec registration locked.
  self assert: Object externalPackageInfo = 'externalPackages'