private
compareLessThan: aMetacelloVersionNumber
    | mySize aSize commonSize count more |
    false
        ifTrue: [ self halt ].
    mySize := self size.
    aSize := aMetacelloVersionNumber size.
    commonSize := mySize min: aSize.
    count := 0.
    more := true.
    [ more and: [ count < commonSize ] ]
        whileTrue: [ 
            (self at: count + 1) = (aMetacelloVersionNumber at: count + 1)
                ifTrue: [ count := count + 1 ]
                ifFalse: [ more := false ] ].
    count < commonSize
        ifTrue: [ ^ (self at: count + 1) metacelloSemanticVersionComponentLessThan: (aMetacelloVersionNumber at: count + 1) ].
    mySize < aSize
        ifTrue: [ 
            mySize = 0
                ifTrue: [ ^ true ].
            (self at: commonSize) = (aMetacelloVersionNumber at: commonSize)
                ifFalse: [ ^ true ].
            ^ true ]
        ifFalse: [ 
            mySize = aSize
                ifTrue: [ ^ false ].
            aSize <= 0
                ifTrue: [ ^ false ].
            (self at: commonSize) = (aMetacelloVersionNumber at: commonSize)
                ifFalse: [ ^ false ].
            ^ true ]