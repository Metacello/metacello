querying
isPackageLoaded: aLoader
  MetacelloPlatform current workingCopyFor: self file ifNone: [ ^ false ].
  ^ true