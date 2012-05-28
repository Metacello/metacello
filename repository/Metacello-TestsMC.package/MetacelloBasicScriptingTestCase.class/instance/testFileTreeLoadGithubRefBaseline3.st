tests
testFileTreeLoadGithubRefBaseline3
    "BaselineOfExternal reference from github://dalehenrich/external/repository using illegal #baseline:with:"

    self
        should: [ 
            Metacello new
                project: 'BaselineOfGithubRefXXX';
                repository: 'filetree://' , externalDirectory fullName;
                silently;
                load ]
        raise: Error