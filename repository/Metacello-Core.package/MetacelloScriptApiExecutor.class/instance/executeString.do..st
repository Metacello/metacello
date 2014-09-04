execution callback
executeString: aString do: projectSpecBlock
  (projectSpecGenerator projectSpecCreationBlock value: aString)
    do: [ :projectSpec | 
      projectSpec
        ifNotNil: [ projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ] ]