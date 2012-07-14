*metacello-core-scripting
execute: projectSpecBlock projectSpec: aProjectSpec lookupBlock: lookupBlock registeredProjectSpecs: registeredProjectSpecs
    "look up registered projectSpecs based on the list of names in the receiver"

    self do: [ :projectName | projectSpecBlock value: (lookupBlock value: projectName) ]