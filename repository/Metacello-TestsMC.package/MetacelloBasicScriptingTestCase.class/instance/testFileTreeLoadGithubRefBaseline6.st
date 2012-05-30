tests
testFileTreeLoadGithubRefBaseline6
    "ConfigurationOfExternal reference from http://ss3.gemstone.com/ss/external.html using #configuration:with:"

    Metacello new
        project: 'GithubRefVI';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    self
        validate: 'GithubRefVI'
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
        expectedConfigurationRepository: 'http://ss3.gemstone.com/ss/external'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'