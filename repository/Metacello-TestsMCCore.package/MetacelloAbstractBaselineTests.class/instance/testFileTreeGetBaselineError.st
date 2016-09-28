tests
testFileTreeGetBaselineError
  | repoExternal repoAlternate platform |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  self
    should: [ 
      Metacello new
        baseline: 'ExternalXXX';
        repository: repoExternal;
        get ]
    raise: MetacelloPackageSpecResolutionError