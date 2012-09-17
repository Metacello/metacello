defaults
repositories: locationList
    | repos |
    repos := locationList
        collect: [ :location | 
            | repo |
            repo := MCHttpRepository location: location user: '' password: ''.
            MCRepositoryGroup default repositories detect: [ :each | each = repo ] ].
    repos
        do: [ :each | 
            (each user isEmpty and: [ each password isEmpty ])
                ifTrue: [ self error: 'Empty username/password for ' , each description printString ] ].
    ^ repos