tests scripts
testMissingRepository1
    self
        handleExpectedValidationFailure: [ 
            Metacello new
                project: 'ExternalX';
                className: 'ConfigurationOfExternalX';
                version: '0.9';
                silently;
                load ]