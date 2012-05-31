tests
testGitHubLoad1
    Metacello new
        project: 'External';
        repository: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository';
        load.
    self
        verify: 'External-Core'
        loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    self
        validate: 'External'
        registrySize: 1
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'