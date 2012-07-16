execution callback
executeCollection: aCollection do: projectSpecBlock
    aCollection
        do: [ :projectName | 
            (projectSpecGenerator projectSpecLookupBlock value: projectName)
                do: [ :projectSpec | projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ] ]