tests
testFileTreeLoadGithubRefBaseline2
    self
        should: [ 
            Metacello new
                configuration: 'GithubRefXX';
                repository: 'filetree://' , externalDirectory fullName;
                silently;
                load ]
        raise: MetacelloPackageSpecResolutionError