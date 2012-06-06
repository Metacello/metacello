tests
testFileTreeLoadBaseline1
    self
        should: [ 
            Metacello new
                configuration: 'ExternalX';
                repository: 'filetree://' , externalDirectory fullName;
                silently;
                load ]
        raise: MetacelloPackageSpecResolutionError