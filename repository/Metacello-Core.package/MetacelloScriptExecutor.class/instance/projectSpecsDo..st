execution
projectSpecsDo: aBlock
    self
        projectSpecFromArgsDo: [ :projectSpec :stringCollectionOrBlock :baseNameBlock :classNameBlock | 
            stringCollectionOrBlock
                execute: aBlock
                againstScriptExecutor: self
                projectSpec: projectSpec
                baseNameBlock: baseNameBlock
                classNameBlock: classNameBlock ]