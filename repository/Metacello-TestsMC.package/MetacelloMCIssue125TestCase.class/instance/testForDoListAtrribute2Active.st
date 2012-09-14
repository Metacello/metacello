tests
testForDoListAtrribute2Active
    | project version wc |
    project := self projectWith: #(#'attribute2').
    version := project version: '3.0'.
    version load.
    {('GoferFoo' -> 'GoferFoo-lr.4').
    ('GoferBar' -> 'GoferBar-jf.1').
    ('GoferFaux' -> 'GoferFaux-tg.33').
    ('GoferBeau' -> 'GoferBeau-dkh.56')}
        do: [ :assoc | 
            wc := (GoferPackageReference name: assoc key) workingCopy.
            self assert: wc ancestry ancestors first name = assoc value ]