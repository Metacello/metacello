*metacello-filetree
jsonOn: aStream override: override indent: indent
    "no cr at end"

    aStream
        cr;
        tab: indent;
        nextPutAll: '{"package" : {';
        cr;
        tab: indent + 1;
        nextPutAll: '"name" : "' , self name , '"'.
    (override
        and: [ 
            self getFile notNil & self requires isEmpty not & self includes isEmpty not & self answers isEmpty not
                & self getPreLoadDoIt notNil & self getPostLoadDoIt notNil ])
        ifTrue: [ 
            aStream
                nextPut: $,;
                cr;
                tab: indent + 1;
                nextPutAll: '"override" : true' ].
    self getFile
        ifNotNil: [ :filestr | 
            aStream
                nextPut: $,;
                cr;
                tab: indent + 1;
                nextPutAll: '"file" : "' , filestr , '"' ].
    self
        jsonOn: aStream
        list: self requires
        selector: 'requires'
        indent: indent + 1.
    self
        jsonOn: aStream
        list: self includes
        selector: 'includes'
        indent: indent + 1.
    self jsonOn: aStream answers: self answers indent: indent + 1.
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
    aStream nextPutAll: '}}'