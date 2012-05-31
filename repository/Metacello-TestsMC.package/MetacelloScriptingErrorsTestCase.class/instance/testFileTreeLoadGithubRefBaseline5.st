tests
testFileTreeLoadGithubRefBaseline5
    "ConfigurationOfExternal reference from github://dalehenrich/external:configuration/repository using #configuration:with:"

    Metacello new
        project: 'GithubRefV';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    self
        validate: 'GithubRefV'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName.
    self
        verify: 'External-Core'
        loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    self
        validate: 'External'
        registrySize: 2
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository:
            'github://dalehenrich/external:' , MetacelloScriptingResource externalConfigurationSHA , '/repository'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository:
            'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'