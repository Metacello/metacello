*metacello-filetree
jsonOn: aStream indent: indent
    "no cr at end"

    | first |
    self list isEmpty
        ifTrue: [ ^ self ].
    aStream
        nextPut: $,;
        cr;
        tab: indent;
        nextPutAll: '"repositories" : [ '.
    first := true.
    self list
        do: [ :member | 
            first
                ifFalse: [ aStream nextPut: $, ].
            aStream
                nextPut: $";
                nextPutAll: member spec name;
                nextPut: $".
            first := false ].
    aStream nextPutAll: ']'