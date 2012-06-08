utility
baseNameOf: className
    ^ (className indexOfSubCollection: 'BaselineOf') = 0
        ifTrue: [ 
            (className indexOfSubCollection: 'ConfigurationOf') = 0
                ifTrue: [ className ]
                ifFalse: [ className copyFrom: 'ConfigurationOf' size + 1 to: className size ] ]
        ifFalse: [ className copyFrom: 'BaselineOf' size + 1 to: className size ]