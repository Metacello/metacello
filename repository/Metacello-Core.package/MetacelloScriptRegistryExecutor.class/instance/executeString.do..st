execution callback
executeString: aString do: projectSpecBlock
    (projectSpecGenerator projetSpecLookupBlock value: aString) do: [ :spec | projectSpecBlock value: spec ]