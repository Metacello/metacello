running
setUp
  super setUp.
  MetacelloPlatform current clearPackageCache.
  registry := MetacelloProjectRegistration registry.
  self setUpRepositories.
  self setUpRepositoryContents.
  MetacelloProjectRegistration resetRegistry.
  initialWorkingCopyList := MCWorkingCopy allManagers
    collect: [ :each | each packageName ].
  self disableUndefinedSymbolTracking
    ifTrue: [ 
      Transcript
        cr;
        show: 'sender of disableUndefinedSybolUpdates ' , self printString.
      undefinedSymbols := MetacelloPlatform current disableUndefinedSybolUpdates ]