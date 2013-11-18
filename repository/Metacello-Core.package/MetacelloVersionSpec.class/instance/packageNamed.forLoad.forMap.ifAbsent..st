querying
packageNamed: aString forLoad: forLoad forMap: map ifAbsent: absentBlock
  | importSpec |
  ^ map
    at: aString
    ifAbsent: [ 
      (forLoad and: [ self importArray notNil or: [ self import notNil ] ])
        ifTrue: [ 
          "expect the 'missing' name to be satisfied within context of imported project"
          importArray
            ifNotNil: [ 
              importArray
                do: [ :assoc | 
                  ((assoc value includes: aString) and: [ map includesKey: assoc key ])
                    ifTrue: [ 
                      importSpec := (map at: assoc key) copy
                        name: aString;
                        mergeImportLoads: {aString};
                        yourself.
                      importSpec projectReference name: aString ] ] ].
          importSpec
            ifNil: [ 
              importSpec := (map at: self import ifAbsent: absentBlock) copy
                name: aString;
                mergeImportLoads: {aString};
                yourself.
              importSpec projectReference name: aString ].
          importSpec ]
        ifFalse: [ 
          (aString = 'default' or: [ aString = 'ALL' ])
            ifTrue: [ 
              self project groupSpec
                name: aString;
                includes: self packageNames;
                yourself ]
            ifFalse: [ absentBlock value ] ] ]