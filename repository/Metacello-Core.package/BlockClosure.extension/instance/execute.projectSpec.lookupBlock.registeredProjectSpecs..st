*metacello-core-scripting
execute: projectSpecBlock projectSpec: aProjectSpec lookupBlock: lookupBlock registeredProjectSpecs: registeredProjectSpecs
    "Use receiver as a select block against list of registered/loaded projectSpecs"

    (registeredProjectSpecs select: self) do: projectSpecBlock