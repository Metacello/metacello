running
tearDown
  | finalWorkingCopyList diff |
  super tearDown.
  self tearDownPackages.
  self tearDownRepositories.
  MetacelloProjectRegistration registry: registry.
  self disableUndefinedSymbolTracking
    ifTrue: [ MetacelloPlatform current reenableUndefinedSybolUpdates: undefinedSymbols ].
  finalWorkingCopyList := MetacelloPlatform current workingCopyNames.
  diff := finalWorkingCopyList difference: initialWorkingCopyList.
  diff
    do: [ :leak | 
      Transcript
        cr;
        show:
            'leaked package from ' , self printString , ' -> ' , leak printString ].
  self assert: diff isEmpty