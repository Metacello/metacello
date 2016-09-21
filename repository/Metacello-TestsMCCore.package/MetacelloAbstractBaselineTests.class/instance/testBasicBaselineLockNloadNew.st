tests
testBasicBaselineLockNloadNew
  | projectSpec repoExternal repoAlternate platform sawWarning |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  repoAlternate := 'filetree://'
    , (platform fullNameForDirectory: alternateDirectory).
  Metacello new
    baseline: 'ExternalX';
    repository: repoExternal;
    lock.
  sawWarning := false.
  [ 
  Metacello new
    baseline: 'ExternalX';
    repository: repoAlternate;
    load ]
    on: Warning
    do: [ :ex | 
      sawWarning := true.
      self halt.
      ex resume ].
  self deny: sawWarning.
  projectSpec := (Metacello registry
    baseline: 'ExternalX';
    list) first.
  self assert: projectSpec repositoryDescriptions asArray = {repoAlternate}.
  self assert: projectSpec registration locked.
  self assert: Object externalPackageInfo = 'alternatePackages'