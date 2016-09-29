running
setUpRepositoryContents
  | externalRepo alternateRepo |
  externalRepo := MetacelloPlatform current
    repositoryFromUrl:
      ('filetree://'
        , (MetacelloPlatform current fullNameForDirectory: externalDirectory))
        asUrl.
  alternateRepo := MetacelloPlatform current
    repositoryFromUrl:
      ('filetree://'
        , (MetacelloPlatform current fullNameForDirectory: alternateDirectory))
        asUrl.
  super setUpRepositoryContents.
  self resourceClass current
    setUpBaselineOfAtomicX: externalRepo
      packageVersion: '-dkh.1'
      loadType: self projectLoadType;
    setUpBaselineOfPrePostLoadX: externalRepo
      packageVersion: '-dkh.1'
      loadType: self projectLoadType;
    setUpBaselineOfAtomicX: alternateRepo
      packageVersion: '-dkh.2'
      loadType: self projectLoadType;
    yourself