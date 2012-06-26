querying
packageNamed: aString forMap: map ifAbsent: aBlock
    | package |
    package := map at: aString ifAbsent: [  ].
    package == nil
        ifTrue: [ 
            (aString = 'default' or: [ aString = 'ALL' ])
                ifTrue: [ 
                    package := self project groupSpec
                        name: aString;
                        includes: self packageNames;
                        yourself ]
                ifFalse: [ 
                    self import
                        ifNil: [ ^ aBlock value ]
                        ifNotNil: [ 
                            "expect the 'missing' name to be satisfied within context of imported project"
                            ^ (map at: self import ifAbsent: aBlock) copy
                                mergeImportLoads: {aString};
                                yourself ] ] ].
    ^ package