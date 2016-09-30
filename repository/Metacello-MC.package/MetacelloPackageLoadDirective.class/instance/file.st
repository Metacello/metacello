accessing
file
  ^ self externalReference
    ifNotNil: [ :er | er name ]
    ifNil: [ self resolvedReference name ]