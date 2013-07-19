initialization
primeRegistryFromImage
  "MetacelloProjectRegistration primeRegistryFromImage"

  MetacelloProjectRegistration configurationClasses
    do: [ :cl | 
      (self configurationRegistry includesKey: cl name asString)
        ifFalse: [ 
          "not registered"
          cl project currentVersion
            ifNotNil: [ :version | 
              [ 
              | projectSpec |
              projectSpec := (version project projectSpec
                name: (MetacelloScriptEngine baseNameOf: cl name asString);
                className: cl name asString;
                versionString: version versionString;
                repositories: version project projectPackage repositories copy;
                yourself) asConfigurationProjectSpec.
              projectSpec asProjectRegistration
                loadedInImage: true;
                registerProject ]
                on: Error
                do: [ :ex | 
                  Transcript
                    cr;
                    show:
                        'ERROR registering (MetacelloProjectRegistry>>primeRegistryFromImage): '
                            , cl name printString , ':' , ex description.
                  ex return: nil ] ] ] ].
  MetacelloProjectRegistration baselineClasses
    do: [ :cl | 
      (self baselineRegistry includesKey: cl name asString)
        ifFalse: [ 
          "not registered"
          cl project currentVersion
            ifNotNil: [ :version | 
              | projectSpec |
              projectSpec := (version project projectSpec
                name: (MetacelloScriptEngine baseNameOf: cl name asString);
                repositories: version project projectPackage repositories copy;
                yourself) asBaselineProjectSpec.
              projectSpec asProjectRegistration
                loadedInImage: true;
                registerProject ] ] ]