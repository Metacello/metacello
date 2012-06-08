handlers
handleProjectSpecLoaded: exception
    | registration |
    "This is when we should register the project spec, since this is the moment when the project has been successfully loaded"
    registration := MetacelloProjectRegistration
        registerProjectSpec: exception projectSpec
        ifPresent: [ :existing :new | 
            "unconditionally merge new with existing (updates registration"
            MetacelloProjectRegistration mergeRegistration: existing with: new.
            exception resume ].
    exception resume