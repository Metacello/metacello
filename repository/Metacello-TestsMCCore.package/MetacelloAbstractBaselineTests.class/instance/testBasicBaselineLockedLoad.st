tests
testBasicBaselineLockedLoad
  | projectSpec repo platform |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  Metacello new
    baseline: 'ExternalX';
    repository: repo;
    lock.
  Metacello registry
    baseline: 'ExternalX';
    load.
  projectSpec := (Metacello registry
    baseline: 'ExternalX';
    list) first.
  self assert: projectSpec repositoryDescriptions asArray = {repo}.
  self assert: projectSpec registration locked