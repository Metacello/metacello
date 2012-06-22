accessing
configuration: anObject
    configuration := anObject.
    self
        versionNumberClass:
            ((configuration respondsTo: #'versionNumberClass')
                ifTrue: [ configuration versionNumberClass ]
                ifFalse: [ nil ])