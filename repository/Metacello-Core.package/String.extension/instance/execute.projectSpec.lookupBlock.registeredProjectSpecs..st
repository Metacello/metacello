*metacello-core-scripting
execute: projectSpecBlock projectSpec: aProjectSpec lookupBlock: lookupBlock registeredProjectSpecs: registeredProjectSpecs
    "the receiver is to be used as the name of the given <aProjectSpec>"

    aProjectSpec name: (MetacelloScriptEngine baseNameOf: self).
    projectSpecBlock value: aProjectSpec