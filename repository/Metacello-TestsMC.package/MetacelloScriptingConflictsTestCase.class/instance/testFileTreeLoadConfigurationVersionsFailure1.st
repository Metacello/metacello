tests
testFileTreeLoadConfigurationVersionsFailure1
    self testFileTreeLoadConfigurationVersion.
    self
        should: [ 
            Metacello new
                project: 'ExternalX';
                version: '0.9.1';
                repository: 'filetree://' , configurationDirectory fullName;
                silently;
                load ]
        raise: Error