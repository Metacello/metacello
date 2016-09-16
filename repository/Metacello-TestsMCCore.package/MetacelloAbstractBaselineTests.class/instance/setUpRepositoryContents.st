running
setUpRepositoryContents
  self
    setUpRepositoryContents: self externalRepositoryContents
    sourceRepo: self resourceClass current externalRepository
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl: ('filetree://' , externalDirectory fullName) asUrl)