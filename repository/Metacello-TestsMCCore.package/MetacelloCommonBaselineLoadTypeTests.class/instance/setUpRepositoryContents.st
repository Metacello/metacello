running
setUpRepositoryContents
  super setUpRepositoryContents.
  self resourceClass current
    setUpBaselineOfAtomicX:
        (MetacelloPlatform current
            repositoryFromUrl:
              ('filetree://'
                ,
                  (MetacelloPlatform current fullNameForDirectory: externalDirectory))
                asUrl)
      packageVersion: '-dkh.1'
      loadType: self projectLoadType;
    setUpBaselineOfAtomicX:
        (MetacelloPlatform current
            repositoryFromUrl:
              ('filetree://'
                ,
                  (MetacelloPlatform current fullNameForDirectory: alternateDirectory))
                asUrl)
      packageVersion: '-dkh.2'
      loadType: self projectLoadType;
    yourself