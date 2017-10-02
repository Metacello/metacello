utility
baselineNameFrom: baseName
  "Return the fully-qualified configuration class name."

  ^ (baseName indexOfSubCollection: 'BaselineOf' startingAt: 1) > 0
    ifTrue: [ baseName ]
    ifFalse: [ 'BaselineOf' , baseName ]
