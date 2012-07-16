execution callback
executeCollection: aCollection do: projectSpecBlock
    aCollection
        do: [ :projectName | (projectSpecGenerator projetSpecLookupBlock value: projectName) do: [ :spec | projectSpecBlock value: spec ] ]