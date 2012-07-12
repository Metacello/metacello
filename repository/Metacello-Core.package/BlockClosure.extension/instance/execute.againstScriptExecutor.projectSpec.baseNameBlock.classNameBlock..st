*metacello-core-scripting
execute: projectSpecBlock againstScriptExecutor: aScriptExecutor projectSpec: aProjectSpec baseNameBlock: baseNameBlock classNameBlock: classNameBlock
    "Use receiver as a select block against list of registered/loaded projectSpecs"

    (MetacelloProjectRegistration loadedProjectSpecs select: self) do: projectSpecBlock