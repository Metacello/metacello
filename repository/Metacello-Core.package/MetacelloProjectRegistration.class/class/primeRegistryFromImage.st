accessing
primeRegistryFromImage
    "MetacelloProjectRegistration primeRegistryFromImage"

    self configurationClasses
        do: [ :cl | 
            (self configurationRegistry includesKey: cl name asString)
                ifFalse: [ 
                    "not registered"
                    cl project currentVersion
                        ifNotNil: [ :version | 
                            | projectSpec |
                            projectSpec := (version project projectSpec
                                name: (MetacelloScriptEngine baseNameOf: cl name asString);
                                className: cl name asString;
                                versionString: version versionString;
                                repositories: version project projectPackage repositories copy;
                                yourself) asConfigurationProjectSpec.
                            (self registerProjectSpec: projectSpec) loadedInImage: true ] ] ]