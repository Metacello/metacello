execution
projectSpecsDo: aBlock
    self
        projectSpecFromArgsDo: [ :stringCollectionOrBlock :projectSpec :lookupBlock :registeredProjectSpecs | 
            stringCollectionOrBlock
                execute: aBlock
                projectSpec: projectSpec
                lookupBlock: lookupBlock
                registeredProjectSpecs: registeredProjectSpecs ]