querying
isPackageLoaded: aLoader
  MCWorkingCopy allManagers
    detect: [ :wc | wc packageName = self file ]
    ifNone: [ ^ false ].
  ^ true