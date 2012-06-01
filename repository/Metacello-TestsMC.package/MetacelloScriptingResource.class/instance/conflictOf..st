baseline:with:
conflictOf: spec
    <version: '1.0'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'MetacelloScriptingResource>>conflictOf:'.
            spec author: 'dkh'.
            spec timestamp: '6/1/2012 14:46' ].
    spec
        for: #'custom'
        do: [ 
            spec
                configuration: 'ExternalX'
                with: [ 
                    spec
                        version: '0.9.1';
                        repository: 'dictionary://Metacello_Conflict_Test_Repository' ] ]