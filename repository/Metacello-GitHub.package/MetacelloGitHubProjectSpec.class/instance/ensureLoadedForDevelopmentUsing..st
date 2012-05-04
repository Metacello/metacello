loading
ensureLoadedForDevelopmentUsing: mcLoader
    "download the bits from the web and stash them on disk somewhere ... the disk copy of the repository 'replaces' the need for an in-image ConfigurationOf class"

    mcLoader ensuredMap
        at: self name
        ifAbsent: [ 
            "no in-image artifact to be loaded, just ensure that the correct version of repository has been downloaded"
            self fetchUsing: mcLoader.
            mcLoader ensuredMap at: self name put: #'present' ]