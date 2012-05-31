tests
testFileTreeLoadBaseline1
    self
        should: [ 
            Metacello new
                project: 'ExternalX';
                repository: 'filetree://' , externalDirectory fullName;
                silently;
                load ]
        raise: MetacelloPackageSpecResolutionError