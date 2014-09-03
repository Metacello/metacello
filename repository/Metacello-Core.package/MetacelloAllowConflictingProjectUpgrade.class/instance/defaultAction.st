exception handling
defaultAction
  self existingProjectRegistration locked
    ifTrue: [ 
      "https://github.com/dalehenrich/metacello-work/issues/263"
      ^ self useNew ].
  ^ MetacelloConflictingProjectError
    signal:
      'Load Conflict between existing ' , self existingProjectRegistration printString
        , ' and ' , self newProjectRegistration printString