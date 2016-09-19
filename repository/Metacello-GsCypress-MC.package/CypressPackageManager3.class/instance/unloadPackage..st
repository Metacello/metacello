Unloading
unloadPackage: aPackage

  | loader summary |
  loader := (CypressPackageDefinition named: aPackage name) snapshot
              unload.
  summary := Dictionary new.
  loader unloadable notEmpty
    ifTrue: [ 
      summary
        at: 'Unloadable'
        put: (loader unloadable collect: [ :each | each printString ]) ].
  loader errors notEmpty
    ifTrue: [ summary at: 'Errors' put: (loader errors collect: [ :each | each printString ]) ].
  loader requirements notEmpty
    ifTrue: [ summary at: 'Missing Requirements' put: loader requirements asArray ].
  ^ summary
