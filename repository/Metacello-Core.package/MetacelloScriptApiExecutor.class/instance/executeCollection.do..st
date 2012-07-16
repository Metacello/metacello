execution callback
executeCollection: aCollection do: projectSpecBlock
    aCollection
        do: [ :projectName | (projectSpecGenerator projectSpecLookupBlock value: projectName) do: [ :spec | projectSpecBlock value: spec ] ]