tests
testFileTreeLoadGithubRefBaseline3
    "BaselineOfExternal reference from github://dalehenrich/external/repository using illegal #baseline:with:"

    self
        should: [ 
            Metacello new
                project: 'GithubRefXXX';
                repository: 'filetree://' , externalDirectory fullName;
                silently;
                load ]
        raise: Error