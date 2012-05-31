tests
testFileTreeLoadGithubRefBaseline7
    "BaselineOfExternal reference from http://ss3.gemstone.com/ss/external.html using #baseline:with:"

    Metacello new
        baseline: 'GithubRefVII';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    self
        validate: 'GithubRefVII'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName.
    self verify: 'External-Core' loadedFrom: 'http://ss3.gemstone.com/ss/external'.
    self
        validate: 'External'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'http://ss3.gemstone.com/ss/external'