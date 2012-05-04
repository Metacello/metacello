querying
repository
    | specs |
    (specs := self repositorySpecs) isEmpty
        ifTrue: [ ^ nil ].
    ^ specs first