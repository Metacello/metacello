tests
testBaselineRegister
  | projectSpec repo platform |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  Metacello new
    baseline: 'ExternalX';
    repository: repo;
    register.
  projectSpec := (Metacello registry
    baseline: 'ExternalX';
    list) first.
  self assert: projectSpec repositoryDescriptions asArray = {repo}