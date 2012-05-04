*metacello-filetree
jsonOn: aStream indent: indent
    "no cr at end"

    aStream
        cr;
        tab: indent;
        nextPutAll: '{"group" : {';
        cr;
        tab: indent + 1;
        nextPutAll: '"name" : "' , self name , '"'.
    self
        jsonOn: aStream
        list: self includes
        selector: 'includes'
        indent: indent + 1.
    aStream nextPutAll: '}}'