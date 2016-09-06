running
setUpRepositoryContents
  super setUpRepositoryContents.
  self
    setUpRepositoryContents: self configurationRepositoryContents
    sourceRepo: MetacelloScriptingResource current configurationRepository
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl: 'filetree://' , configurationDirectory fullName)
        asUrl.
  self
    setUpRepositoryContents: self externalRepositoryContents
    sourceRepo: MetacelloScriptingResource current externalRepository
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl: 'filetree://' , externalDirectory fullName) asUrl.
  self
    setUpRepositoryContents: self sampleRepositoryContents
    sourceRepo: MetacelloScriptingResource current sampleRepository
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl: 'filetree://' , sampleDirectory fullName) asUrl