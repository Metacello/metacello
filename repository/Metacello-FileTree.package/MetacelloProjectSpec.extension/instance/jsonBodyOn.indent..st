*metacello-filetree
jsonBodyOn: aStream indent: indent
    "no cr at end"

    self versionString isSymbol
        ifTrue: [ 
            self
                jsonOn: aStream
                for: self versionString
                selector: 'symbolicVersion'
                indent: indent + 1 ]
        ifFalse: [ 
            self
                jsonOn: aStream
                for: self versionString
                selector: 'version'
                indent: indent + 1 ].
    self
        jsonOn: aStream
        list: self loads
        selector: 'load'
        indent: indent + 1.
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
    self repositories jsonOn: aStream indent: indent + 1