querying
workingCopy
  "Answer a working copy or throw an error if not present."

  | pName |
  cachedVersion == nil
    ifTrue: [ ^ super workingCopy ].
  pName := cachedVersion package name.
  ^ MetacelloPlatform current
    workingCopyFor: pName
    ifNone: [ self error: 'Working copy for ' , self name , ' not found' ]