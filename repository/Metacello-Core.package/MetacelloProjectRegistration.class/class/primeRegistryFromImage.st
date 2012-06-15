accessing
primeRegistryFromImage
    "self primeRegistryFromImage"

    self configurationClasses
        do: [ :cl | 
            (self configurationRegistry includesKey: cl)
                ifFalse: [ 
                    "not registered"
                    cl project currentVersion
                        ifNotNil: [ :version | 
                            | projectSpec |
                            projectSpec := (version project projectSpec
                                name: (MetacelloScriptEngine baseNameOf: cl name asString);
                                className: cl name asString;
                                versionString: version versionString;
                                repository: version project projectPackage repository;
                                yourself) asConfigurationProjectSpec.
                            self registerProjectSpec: projectSpec ] ] ]