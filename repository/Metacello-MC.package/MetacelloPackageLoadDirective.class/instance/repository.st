accessing
repository
  ^ self externalReference
    ifNotNil: [ :er | er repository ]
    ifNil: [ self resolvedReference repository ]
