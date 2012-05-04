*metacello-filetree
jsonOn: aStream indent: indent
    "no cr at end"

    aStream
        cr;
        tab: indent;
        nextPutAll: '{"' , self projectLabel , '" : {';
        cr;
        tab: indent + 1;
        nextPutAll: '"name" : "' , self name , '"'.
    self jsonBodyOn: aStream indent: indent.
    aStream nextPutAll: '}}'