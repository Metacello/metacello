utility
baselineProjectNameOf: baselineClassName
    ^ (baselineClassName indexOfSubCollection: 'BaselineOf') = 0
        ifTrue: [ baselineClassName ]
        ifFalse: [ baselineClassName copyFrom: 'BaselineOf' size + 1 to: baselineClassName size ]