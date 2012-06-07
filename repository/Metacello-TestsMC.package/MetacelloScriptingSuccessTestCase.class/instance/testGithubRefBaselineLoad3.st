tests
testGithubRefBaselineLoad3
    "loading 'Core' and 'Tests' groups using project:copyFrom:with:"

    Metacello new
        baseline: 'GithubRefXIII';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load: #('External Core' 'External Tests').
    self
        validate: 'GithubRefXIII'
        registrySize: 3
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName.
    self
        verify: 'External-Core'
        loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    self
        verify: 'External-Tests'
        loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    self
        validate: 'External Core'
        registrySize: 3
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository:
            'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    self
        validate: 'External Tests'
        registrySize: 3
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository:
            'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'