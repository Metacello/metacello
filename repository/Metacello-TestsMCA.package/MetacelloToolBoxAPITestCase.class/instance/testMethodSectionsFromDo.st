tests
testMethodSectionsFromDo
  | fileNames expected |
  self create12Version.
  fileNames := Set new.
  [ 
  (MetacelloToolBox configurationNamed: self configurationName)
    methodSectionsFrom: '1.2'
    do: [ :methodSection | 
      methodSection versionSpec
        specListProjectDo: [ :spec |  ]
        packageDo: [ :spec | fileNames add: spec file ]
        groupDo: [ :spec |  ].
      false ] ]
    on: MetacelloCannotUpdateReleasedVersionError
    do: [ :ex | ex resume ].
  expected := #('GeauxFaux-tg.32' 'GeauxBeau-dkh.55' 'GoferFoo-lr.1' 'GoferFaux-tg.32' 'GoferBeau-dkh.55' 'GoferBar-lr.1').
  self assert: fileNames size = expected size.
  self assert: (fileNames difference: expected asSet) isEmpty