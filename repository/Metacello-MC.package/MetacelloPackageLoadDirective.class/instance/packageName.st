accessing
packageName
  ^ self externalReference
    ifNotNil: [ :er | er packageName ]
    ifNil: [ self resolvedReference packageName ]