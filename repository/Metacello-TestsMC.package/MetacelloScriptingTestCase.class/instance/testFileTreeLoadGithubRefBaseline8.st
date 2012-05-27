tests
testFileTreeLoadGithubRefBaseline8
    "BaselineOfExternal reference from github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository using #baseline:with:"

    Metacello new
        project: 'BaselineOfGithubRefVIII';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        get.
    Metacello new
        project: 'BaselineOfGithubRefVIII';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    self
        validate: 'BaselineOfGithubRefVIII'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName.
    self
        verify: 'External-Core'
        loadedFrom: 'github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository'.
    self
        validate: 'External'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository'