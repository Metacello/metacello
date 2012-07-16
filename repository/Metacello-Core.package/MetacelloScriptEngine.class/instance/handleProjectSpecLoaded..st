handlers
handleProjectSpecLoaded: exception
    (MetacelloProjectRegistration
        registerProjectSpec: exception projectSpec
        ifPresent: [ :existing :new | 
            "unconditionally merge new with existing (updates registration"
            MetacelloProjectRegistration mergeRegistration: existing with: new ]) loadedInImage: true.
    exception resume