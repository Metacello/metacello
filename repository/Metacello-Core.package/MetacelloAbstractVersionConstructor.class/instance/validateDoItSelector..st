validation
validateDoItSelector: anObject
  anObject == nil
    ifTrue: [ ^ self ].
  (MetacelloPlatform current isSymbol: anObject)
    ifFalse: [ self error: 'Invalid message selector for doit: ' , anObject printString ]