querying
currentlyLoadedClassesInPackage
    | wc |
    wc := [ self workingCopy ]
        on: Error
        do: [ :ex | ex return: nil ].
    wc ~~ nil
        ifTrue: [ ^ wc packageInfo classes ].
    ^ #()