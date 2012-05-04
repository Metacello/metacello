*metacello-filetree
jsonCopyMember: aMember on: aStream indent: indent
    "no cr at end"

    aStream
        cr;
        tab: indent;
        nextPutAll: '{"' , self projectLabel , '" : {';
        cr;
        tab: indent + 1;
        nextPutAll: '"name" : "' , self name , '",';
        cr;
        tab: indent + 1;
        nextPutAll: '"copyFrom" : "' , aMember sourceName , '"'.
    self jsonBodyOn: aStream indent: indent.
    aStream nextPutAll: '}}'