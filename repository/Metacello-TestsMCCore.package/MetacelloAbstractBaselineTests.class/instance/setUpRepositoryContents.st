running
setUpRepositoryContents
  externalPackages := self resourceClass current externalPackages.
  self resourceClass current
    setUpRepositoryContents: self externalRepositoryContents
    sourceRepo: externalPackages
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl:
          ('filetree://'
            ,
              (MetacelloPlatform current fullNameForDirectory: externalDirectory))
            asUrl)