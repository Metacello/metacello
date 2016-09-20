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
      ex resume ].
  self assert: sawWarning.
  projectSpec := (Metacello registry
    baseline: 'ExternalX';
    list) first.
  self assert: projectSpec repositoryDescriptions asArray = {repoExternal}.
  self assert: projectSpec registration locked.
  self assert: Object externalPackageInfo = 'externalPackages'