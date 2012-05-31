tests
testFileTreeLoadGithubRefBaseline2
    self
        should: [ 
            Metacello new
                project: 'GithubRefXX';
                repository: 'filetree://' , externalDirectory fullName;
                silently;
                load ]
        raise: MetacelloPackageSpecResolutionError