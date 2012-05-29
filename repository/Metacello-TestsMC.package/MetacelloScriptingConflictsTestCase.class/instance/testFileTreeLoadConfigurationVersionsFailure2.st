tests
testFileTreeLoadConfigurationVersionsFailure2
    self testFileTreeLoadConfigurationVersions.
    self
        should: [ 
            Metacello new
                project: 'ExternalX';
                version: '0.9';
                repository: 'filetree://' , configurationDirectory fullName;
                silently;
                load ]
        raise: Error