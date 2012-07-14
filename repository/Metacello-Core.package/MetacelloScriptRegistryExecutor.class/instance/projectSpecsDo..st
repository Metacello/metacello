execution
projectSpecsDo: aBlock
    "do lookup of projectSpec for  String  and list args, select on registeredProjectSoecs for block arg"

    self
        projectSpecFromArgsDo: [ :stringCollectionOrBlock :projectSpecCreateBlock :lookupBlock :registeredProjectSpecs | 
            stringCollectionOrBlock
                execute: aBlock
                projectSpec: lookupBlock
                lookupBlock: lookupBlock
                registeredProjectSpecs: registeredProjectSpecs ]