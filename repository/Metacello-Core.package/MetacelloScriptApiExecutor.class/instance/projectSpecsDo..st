execution
projectSpecsDo: aBlock
    "do lcreate projectspec for String arg, ookup for list arg, select on registeredProjectSoecs for block arg"

    self
        projectSpecFromArgsDo: [ :stringCollectionOrBlock :projectSpecCreateBlock :lookupBlock :registeredProjectSpecs | 
            stringCollectionOrBlock
                execute: aBlock
                projectSpec: projectSpecCreateBlock
                lookupBlock: lookupBlock
                registeredProjectSpecs: registeredProjectSpecs ]