*metacello-core-scripting
execute: projectSpecBlock againstScriptExecutor: aScriptExecutor projectSpec: aProjectSpec baseNameBlock: baseNameBlock classNameBlock: classNameBlock
    "look up registered projectSpecs based on the list of names in the receiver"

    self
        do: [ :projectName | 
            | projectSpec |
            projectSpec := MetacelloProjectRegistration
                projectSpecForClassNamed: (classNameBlock value: projectName)
                ifAbsent: [ self error: 'no project named ' , projectName printString , ' found' ].
            projectSpecBlock value: projectSpec ]