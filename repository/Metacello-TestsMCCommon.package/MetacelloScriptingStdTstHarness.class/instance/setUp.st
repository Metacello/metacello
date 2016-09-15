running
setUp
  super setUp.
  MetacelloPlatform current clearPackageCache.
  registry := MetacelloProjectRegistration registry.
  self setUpRepositories.
  self setUpRepositoryContents.
  MetacelloProjectRegistration resetRegistry.
  initialWorkingCopyList := MetacelloPlatform current workingCopyNames.
  self disableUndefinedSymbolTracking
    ifTrue: [ undefinedSymbols := MetacelloPlatform current disableUndefinedSybolUpdates ]