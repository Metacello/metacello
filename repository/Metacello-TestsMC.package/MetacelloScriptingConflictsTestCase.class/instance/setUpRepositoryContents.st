running
setUpRepositoryContents
    super setUpRepositoryContents.
    self
        setUpRepositoryContents: #('ConfigurationOfExternalX-dkh.2')
        sourceRepo: MetacelloScriptingResource current configurationRepository
        targetRepo: (MCFileTreeRepository new directory: configurationDirectory)