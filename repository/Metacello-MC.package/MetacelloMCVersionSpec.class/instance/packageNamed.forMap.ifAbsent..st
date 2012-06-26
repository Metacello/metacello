querying
packageNamed: aString forMap: map ifAbsent: absentBlock
    | importSpec |
    ^ map
        at: aString
        ifAbsent: [ 
            self import
                ifNil: [ 
                    (aString = 'default' or: [ aString = 'ALL' ])
                        ifTrue: [ 
                            self project groupSpec
                                name: aString;
                                includes: self packageNames;
                                yourself ]
                        ifFalse: [ absentBlock value ] ]
                ifNotNil: [ 
                    "expect the 'missing' name to be satisfied within context of imported project"
                    importSpec := (map at: self import ifAbsent: absentBlock) copy
                        name: aString;
                        mergeImportLoads: {aString};
                        yourself.
                    importSpec projectReference name: aString.
                    importSpec ] ]