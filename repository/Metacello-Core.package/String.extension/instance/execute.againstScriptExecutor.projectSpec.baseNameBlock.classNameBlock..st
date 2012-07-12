*metacello-core-scripting
execute: projectSpecBlock againstScriptExecutor: aScriptExecutor projectSpec: aProjectSpec baseNameBlock: baseNameBlock classNameBlock: classNameBlock
    aProjectSpec name: (baseNameBlock value: self).
    projectSpecBlock value: aProjectSpec