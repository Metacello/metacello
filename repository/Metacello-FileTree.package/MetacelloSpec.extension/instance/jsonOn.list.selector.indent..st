*metacello-filetree
jsonOn: aStream list: list selector: selector indent: indent
    "no cr at end"

    | first |
    (list isNil or: [ list isEmpty ])
        ifTrue: [ ^ self ].
    aStream
        nextPut: $,;
        cr;
        tab: indent;
        nextPutAll: '"' , selector , '" : ['.
    first := true.
    list
        do: [ :item | 
            first
                ifFalse: [ aStream nextPutAll: ', ' ].
            aStream
                nextPut: $";
                nextPutAll: item;
                nextPutAll: '"'.
            first := false ].
    aStream nextPutAll: ']'