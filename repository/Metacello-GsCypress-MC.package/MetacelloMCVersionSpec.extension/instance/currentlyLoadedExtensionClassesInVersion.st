*metacello-gscypress-mc
currentlyLoadedExtensionClassesInVersion
  | classes |
  classes := Dictionary new.
  self
    projectDo: [ :ignored |  ]
    packageDo: [ :packageSpec | 
      packageSpec isPackageLoaded
        ifTrue: [ self error: 'MetacelloMCVersionSpec>>currentlyLoadedExtensionClassesInVersion is not yet implemented.' ] ]
    groupDo: [ :ignored |  ].
  ^ classes
