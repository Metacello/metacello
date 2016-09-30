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
    setUpBaselineOfRecordX: 'BaselineOfCypressRecordX'
      packageRepo: externalRepo
      packageVersion: '-dkh.1'
      loadType: self projectLoadType
      sourceForProjectClass:
        self resourceClass current sourceCodeForCypressBaselineProjectClass;
    setUpBaselineOfRecordX: 'BaselineOfMCRecordX'
      packageRepo: externalRepo
      packageVersion: '-dkh.1'
      loadType: self projectLoadType
      sourceForProjectClass:
        self resourceClass current sourceCodeForMCBaselineProjectClass;
    setUpBaselineOfAtomicX: alternateRepo
      packageVersion: '-dkh.2'
      loadType: self projectLoadType;
    yourself