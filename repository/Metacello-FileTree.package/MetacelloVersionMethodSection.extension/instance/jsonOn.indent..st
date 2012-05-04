*metacello-filetree
jsonOn: aStream indent: indent
    aStream
        cr;
        tab: indent + 1;
        nextPutAll: '{"';
        nextPutAll: self attribute asString;
        nextPutAll: '" : ';
        cr.
    versionSpec jsonOn: aStream indent: indent + 1.
    aStream nextPutAll: '}'