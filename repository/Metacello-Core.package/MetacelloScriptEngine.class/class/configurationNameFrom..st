utility
configurationNameFrom: baseName
  "Return the fully-qualified configuration class name."

  ^ (baseName indexOfSubCollection: 'ConfigurationOf' startingAt: 1) > 0
    ifTrue: [ baseName ]
    ifFalse: [ 'ConfigurationOf' , baseName ]