*metacello-filetree
jsonOn: aStream indent: indent
    "no cr at end"

    | first |
    aStream
        tab: indent + 1;
        nextPutAll: '['.
    self
        jsonOn: aStream
        for: self getPreLoadDoIt
        selector: 'preLoadDoIt'
        indent: indent + 1.
    self
        jsonOn: aStream
        for: self getPostLoadDoIt
        selector: 'postLoadDoIt'
        indent: indent + 1.
    first := true.
    self packagesSpec list
        do: [ :member | 
            member spec name ~~ nil
                ifTrue: [ 
                    first
                        ifFalse: [ aStream nextPut: $, ].
                    member jsonOn: aStream indent: indent + 1.
                    first := false ] ].
    aStream nextPutAll: ']'