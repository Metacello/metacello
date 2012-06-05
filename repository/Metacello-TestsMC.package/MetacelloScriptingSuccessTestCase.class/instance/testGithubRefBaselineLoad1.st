tests
testGithubRefBaselineLoad1
    "loading 'Core' package only"

    Metacello new
        baseline: 'GithubRefXI';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load: 'Core'.
    self
        validate: 'GithubRefXI'
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
        validate: 'External'
        registrySize: 2
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository:
            'github://dalehenrich/external:' , MetacelloScriptingResource externalConfigurationSHA , '/repository'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository:
            'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'