querying
projectClass
    className == nil
        ifTrue: [ ^ nil ].
    ^ Smalltalk at: self className asSymbol ifAbsent: [  ]