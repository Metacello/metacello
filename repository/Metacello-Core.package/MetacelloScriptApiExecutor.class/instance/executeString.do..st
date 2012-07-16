execution callback
executeString: aString do: projectSpecBlock
    (projectSpecGenerator projectSpecCreationBlock value: aString) do: [ :spec | projectSpecBlock value: spec ]