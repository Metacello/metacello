tests
testBaselineCurrentlyLoadedClassesInProject
  | repoAlternate platform currentlyLoadedClassInProject |
  platform := MetacelloPlatform current.
  repoAlternate := 'filetree://'
    , (platform fullNameForDirectory: alternateDirectory).
  platform
    globalNamed: 'Metacello_ExternalX_ExternalRepository_URL'
    put: repoAlternate.
  Metacello new
    baseline: 'ExternalX';
    repository: repoAlternate;
    silently;
    load.
  currentlyLoadedClassInProject := (MetacelloProjectRegistration registry
    baselineRegistry at: 'BaselineOfExternalX' ifAbsent: [  ])
    ifNil: [ self assert: false ]
    ifNotNil: [ :registration | registration currentlyLoadedClassesInProject ].
  self assert: currentlyLoadedClassInProject size == 1.
  self assert: (currentlyLoadedClassInProject
        includes: (MetacelloPlatform current globalNamed: 'ExternalCoreX'))