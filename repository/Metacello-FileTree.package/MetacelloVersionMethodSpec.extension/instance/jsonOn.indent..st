*metacello-filetree
jsonOn: aStream indent: indent
    | first |
    aStream
        nextPutAll: '[';
        cr;
        tab: indent + 1;
        nextPutAll: '{"';
        nextPutAll: self versionString;
        nextPutAll: '" : ['.
    first := true.
    self methodSections
        do: [ :section | 
            first
                ifFalse: [ aStream nextPut: $, ].
            section jsonOn: aStream indent: indent + 1.
            first := false ].
    aStream
        cr;
        tab;
        nextPutAll: ']}';
        cr;
        nextPut: $]