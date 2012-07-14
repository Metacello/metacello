*metacello-core-scripting
execute: projectSpecBlock projectSpec: aProjectSpec lookupBlock: lookupBlock registeredProjectSpecs: registeredProjectSpecs
    "look up registered projectSpecs based on the list of names in the receiver"

    self do: [ :projectName | (lookupBlock value: projectName) do: [ :spec | projectSpecBlock value: spec ] ]