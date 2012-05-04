printing
jsonOn: aStream
    | first |
    aStream
        nextPut: $[;
        cr;
        tab;
        nextPutAll: '{"baseline" : ['.
    first := true.
    self methodSections
        do: [ :methodSection | 
            first
                ifFalse: [ aStream nextPut: $, ].
            methodSection jsonOn: aStream indent: 1.
            first := false ].
    aStream
        cr;
        tab;
        nextPutAll: ']}';
        cr;
        nextPut: $]