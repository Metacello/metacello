deploy
extractFileNamesFrom: version
    | fileNames |
    fileNames := Set new.
    [ 
    (MetacelloToolBox configurationNamed: 'Metacello')
        methodSectionsFrom: version versionString
        do: [ :methodSection | 
            methodSection versionSpec
                specListProjectDo: [ :spec |  ]
                packageDo: [ :spec | 
                    spec getFile ~~ nil
                        ifTrue: [ fileNames add: spec file ] ]
                groupDo: [ :spec |  ].
            false ] ]
        on: MetacelloCannotUpdateReleasedVersionError
        do: [ :ex | ex resume ].
    ^ fileNames