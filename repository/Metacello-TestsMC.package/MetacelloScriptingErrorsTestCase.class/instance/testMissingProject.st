tests scripts
testMissingProject
    self
        handleExpectedValidationFailure: [ 
            Metacello new
                className: 'ConfigurationExternalX';
                version: '0.9';
                repository: 'filetree://' , configurationDirectory fullName;
                silently;
                load ]