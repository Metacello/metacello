running
tearDown
  | finalWorkingCopyList diff |
  super tearDown.
  self tearDownPackages.
  self tearDownRepositories.
  MetacelloProjectRegistration registry: registry.
  Transcript
    cr;
    show:
        'sender of reenableUndefinedSybolUpdates: ' , self class name printString.
  self disableUndefinedSymbolTracking
    ifTrue: [ MetacelloPlatform current reenableUndefinedSybolUpdates: undefinedSymbols ].
  finalWorkingCopyList := MCWorkingCopy allManagers
    collect: [ :each | each packageName ].
  diff := finalWorkingCopyList difference: initialWorkingCopyList.
  diff
    do: [ :leak | 
      Transcript
        cr;
        show:
            'leaked package from ' , self printString , ' -> ' , leak printString ].
  self assert: diff isEmpty