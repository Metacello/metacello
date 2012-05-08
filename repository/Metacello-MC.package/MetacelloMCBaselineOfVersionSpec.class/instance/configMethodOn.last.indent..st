printing
configMethodOn: aStream last: last indent: indent
    | hasRepositories spec |
    hasRepositories := (spec := repositorySpec) ~~ nil and: [ spec description ~~ nil ].
    super configMethodOn: aStream last: hasRepositories not indent: indent.
    hasRepositories
        ifTrue: [ 
            spec configMethodOn: aStream indent: indent.
            aStream nextPutAll: '.' ].
    last
        ifFalse: [ aStream cr ]