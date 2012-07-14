*metacello-core-scripting
execute: projectSpecBlock projectSpec: projectSpecCreateBlock lookupBlock: lookupBlock registeredProjectSpecs: registeredProjectSpecs
    "the receiver is to be used as the name of the given <aProjectSpec>"

    (projectSpecCreateBlock value: self) do: [ :spec | projectSpecBlock value: spec ]