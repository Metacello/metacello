running
setUpRepositoryContents
  " alternatePackages and externalPackages have the same packages with slightly different contents stored in two different repos .. "

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
            asUrl).
  alternatePackages := self resourceClass current alternatePackages.
  self resourceClass current
    setUpRepositoryContents: self alternateRepositoryContents
    sourceRepo: alternatePackages
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl:
          ('filetree://'
            ,
              (MetacelloPlatform current fullNameForDirectory: alternateDirectory))
            asUrl)