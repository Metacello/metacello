tests scripts
testMissingRepository3
    self
        handleExpectedValidationFailure: [ 
            Metacello new
                baseline: 'ExternalX';
                silently;
                load ]