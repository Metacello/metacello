*metacello-gscypress-mc
currentlyLoadedClassesInVersion
  | classes |
  classes := Set new.
  self
    projectDo: [ :ignored |  ]
    packageDo: [ :packageSpec | 
      packageSpec isPackageLoaded
        ifTrue: [ classes addAll: (CypressPackageDefinition named: packageSpec file) classes ] ]
    groupDo: [ :ignored |  ].
  ^ classes
