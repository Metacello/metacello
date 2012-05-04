*metacello-filetree
jsonOn: aStream for: spec selector: selector indent: indent
    "no cr at end"

    spec ifNil: [ ^ self ].
    aStream
        nextPut: $,;
        cr;
        tab: indent;
        nextPut: $";
        nextPutAll: selector;
        nextPutAll: '" : "';
        nextPutAll: spec value asString;
        nextPutAll: '"'