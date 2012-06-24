querying
currentlyLoadedClassesInPackage
    "for a baseline, we'll traverse loaded packages in our version "

    self versionOrNil ifNotNil: [ :vrsn | ^ vrsn currentlyLoadedClassesInVersion ].
    ^ #()