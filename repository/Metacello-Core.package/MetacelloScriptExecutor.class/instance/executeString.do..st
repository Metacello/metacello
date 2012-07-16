execution callback
executeString: aString do: projectSpecBlock
    (projectSpecGenerator projectSpecLookupBlock value: aString) do: [ :spec | projectSpecBlock value: spec ]