handlers
handleProjectSpecLoaded: exception
    (MetacelloProjectRegistration
        registerProjectSpec: exception projectSpec
        ifPresent: [ :existing :new | 
            "unconditionally merge new with existing (updates registration"
            existing mergeRegistration: new ]) loadedInImage: true.
    exception resume