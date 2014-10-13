version patterns
projectVersionFromString: aString
  | versionString |
  versionString := aString.
  (versionString beginsWith: 'v')
    ifTrue: [ versionString := versionString copyFrom: 2 to: versionString size ].
  ^ MetacelloVersionNumber fromString: versionString