tests scripts
testMissingVersion2
    self
        handleExpectedValidationFailure: [ 
            Metacello new
                configuration: 'ExternalX';
                repository: 'filetree://' , configurationDirectory fullName;
                silently;
                load ]