spec creation
createProjectReferenceSpec: projectBaseName
  | projectSpec |
  projectSpec := (Metacello image
    project: projectBaseName;
    list)
    detect: [ :each | true ]
    ifNone: [ 
      self
        error:
          'The project ' , projectBaseName printString
            , ' is not currently loaded in the image.' ].
  ^ project projectReferenceSpec
    name: projectBaseName;
    projectReference: projectSpec;
    yourself