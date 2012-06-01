running
setUpRepositoryContents
    super setUpRepositoryContents.
    self
        setUpRepositoryContents:
            #('ConfigurationOfExternalX-dkh.1' 'ConfigurationOfExternalXX-dkh.1' 'ConfigurationOfExternalXXX-dkh.1' 'ConfigurationOfExternalIV-dkh.1' 'MarianosImage-dkh.1')
        sourceRepo: MetacelloScriptingResource current configurationRepository
        targetRepo: (MCFileTreeRepository new directory: configurationDirectory).
    self
        setUpRepositoryContents:
            #('External-CoreX-dkh.1' 'BaselineOfExternalX-dkh.1' 'BaselineOfGithubRefXX-dkh.1' 'BaselineOfGithubRefXXX-dkh.1' 'BaselineOfGithubRefIV-dkh.1' 'BaselineOfGithubRefV-dkh.1' 'BaselineOfGithubRefVI-dkh.1' 'BaselineOfGithubRefVII-dkh.1' 'BaselineOfGithubRefVIII-dkh.1' 'BaselineOfGithubRefIX-dkh.1')
        sourceRepo: MetacelloScriptingResource current externalRepository
        targetRepo: (MCFileTreeRepository new directory: externalDirectory).
    self
        setUpRepositoryContents: #('Sample-CoreX-dkh.1')
        sourceRepo: MetacelloScriptingResource current sampleRepository
        targetRepo: (MCFileTreeRepository new directory: sampleDirectory)