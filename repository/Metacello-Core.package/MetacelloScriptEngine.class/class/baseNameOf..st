utility
baseNameOf: className
  ^ ((className indexOfSubCollection: 'BaselineOf') = 1)
    ifTrue: [ className copyFrom: 'BaselineOf' size + 1 to: className size ]
    ifFalse: [ 
      ((className indexOfSubCollection: 'ConfigurationOf') = 1)
        ifTrue: [ className copyFrom: 'ConfigurationOf' size + 1 to: className size ]
        ifFalse: [ className ] ]
