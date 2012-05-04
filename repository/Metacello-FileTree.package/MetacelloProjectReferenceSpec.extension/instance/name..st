*metacello-filetree
name: aString
    super name: aString.
    self projectReference notNil ifTrue: [ self projectReference name: aString]