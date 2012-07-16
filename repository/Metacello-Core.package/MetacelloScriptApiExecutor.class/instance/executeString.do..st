execution callback
executeString: aString do: projectSpecBlock
    (projectSpecGenerator projectSpecCreationBlock value: aString)
        do: [ :projectSpec | projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ]