tests scripts
testMissingVersion1
    self
        handleExpectedValidationFailure: [ 
            Metacello new
                project: 'ExternalX';
                className: 'ConfigurationOfExternalX';
                repository: 'filetree://' , configurationDirectory fullName;
                silently;
                load ]