tests
testFileTreeGetBaseline
    self
        should: [ 
            Metacello new
                project: 'ExternalX';
                repository: 'filetree://' , externalDirectory fullName;
                get ]
        raise: MetacelloPackageSpecResolutionError