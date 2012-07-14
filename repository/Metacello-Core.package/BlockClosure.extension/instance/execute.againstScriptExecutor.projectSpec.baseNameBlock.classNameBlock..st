*metacello-core-scripting
execute: projectSpecBlock againstScriptExecutor: aScriptExecutor projectSpec: aProjectSpec baseNameBlock: baseNameBlock classNameBlock: classNameBlock
    "Use receiver as a select block against list of registered/loaded projectSpecs"

    ((MetacelloProjectRegistration projectSpecs
        select: [ :spec | 
            (MetacelloProjectRegistration
                projectSpecForClassNamed: (classNameBlock value: (baseNameBlock value: spec className))
                ifAbsent: [ nil ]) notNil ]) select: self) do: projectSpecBlock