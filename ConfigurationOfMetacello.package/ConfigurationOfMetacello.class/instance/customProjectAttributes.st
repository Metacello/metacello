accessing
customProjectAttributes
    "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes "

    | attributes |
    attributes := #(#'Gofer-Core').
    Smalltalk
        at: #'SystemVersion'
        ifPresent: [ :cl | 
            (cl current version beginsWith: 'Pharo')
                ifTrue: [ 
                    (cl current perform: #'highestUpdate') <= 10504
                        ifTrue: [ attributes := #(#'Gofer') ] ] ].
    ^ attributes