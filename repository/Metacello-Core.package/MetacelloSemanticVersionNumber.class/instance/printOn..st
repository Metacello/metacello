printing
printOn: aStream
    | pre build beforeFirst |
    beforeFirst := true.
    pre := self preReleaseIndex.
    build := self buildIndex.
    1 to: self size do: [ :index | 
        index = pre
            ifTrue: [ aStream nextPut: $- ]
            ifFalse: [ 
                index = build
                    ifTrue: [ aStream nextPut: $+ ]
                    ifFalse: [ 
                        beforeFirst
                            ifTrue: [ beforeFirst := false ]
                            ifFalse: [ aStream nextPut: $. ] ] ].
        aStream nextPutAll: (self at: index) asString ]