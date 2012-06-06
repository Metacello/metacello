tests scripts
testMissingRepository2
    self
        handleExpectedValidationFailure: [ 
            Metacello new
                configuration: 'ExternalX';
                version: '0.9';
                silently;
                load ]