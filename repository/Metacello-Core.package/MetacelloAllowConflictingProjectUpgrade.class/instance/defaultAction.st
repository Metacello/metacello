exception handling
defaultAction
  self existingProjectRegistration locked
    ifTrue: [ 
      "https://github.com/dalehenrich/metacello-work/issues/263"
      [ ^ self useIncoming ]
        on: MetacelloAllowLockedProjectChange
        do: [ :ex | 
          "ensure that locked project change is allowed"
          ex allow ] ].
  ^ MetacelloConflictingProjectError
    signal:
      'Load Conflict between existing ' , self existingProjectRegistration printString
        , ' and ' , self newProjectRegistration printString