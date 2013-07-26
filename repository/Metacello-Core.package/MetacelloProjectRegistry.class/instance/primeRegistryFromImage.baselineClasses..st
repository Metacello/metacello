initialization
primeRegistryFromImage: configurationClasses baselineClasses: baselineClasses
  "MetacelloProjectRegistration primeRegistryFromImage"

  configurationClasses
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
  baselineClasses
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
              MetacelloProjectRegistration
                registrationForProjectSpec: projectSpec
                ifAbsent: [ :new | 
                  new
                    loadedInImage: true;
                    registerProject ]
                ifPresent: [ :existing :new | 
                  existing
                    copyOnWrite: [ :existingCopy | 
                      existingCopy
                        loadedInImage: true;
                        merge: new ] ] ] ] ]