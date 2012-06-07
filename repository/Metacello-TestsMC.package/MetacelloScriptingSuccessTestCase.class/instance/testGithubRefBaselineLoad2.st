tests
testGithubRefBaselineLoad2
    "loading 'Core' and 'Tests' groups "

    Metacello new
        baseline: 'GithubRefXII';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load: #('External Core' 'External Tests').
    self
        validate: 'GithubRefXII'
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