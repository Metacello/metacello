tests
testGithubRefBaselineLoad1
    "loading 'Core' group only"

    Metacello new
        baseline: 'GithubRefXII';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load: 'External Core'.
    self
        validate: 'GithubRefXII'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName.
    self
        verify: 'External-Core'
        loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    self verifyPackageNotLoaded: 'External-Tests'.
    self
        validate: 'External Core'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository:
            'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'