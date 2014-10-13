version patterns
projectVersionFromString: aString forPattern: forPattern
  | versionString |
  versionString := aString.
  (versionString beginsWith: 'v')
    ifTrue: [ versionString := versionString copyFrom: 2 to: versionString size ].
  ^ MetacelloSemanticVersionNumber
    fromString: versionString
    forPattern: forPattern