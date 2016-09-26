tests
testBasicBaselineLockNUnlockNload
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
  Metacello new
    baseline: 'ExternalX';
    repository: repoAlternate;
    load.
  projectSpec := (Metacello registry
    baseline: 'ExternalX';
    list) first.
  self assert: projectSpec repositoryDescriptions asArray = {repoAlternate}.
  self deny: projectSpec registration locked.
  self assert: Object externalPackageInfo = 'alternatePackages'