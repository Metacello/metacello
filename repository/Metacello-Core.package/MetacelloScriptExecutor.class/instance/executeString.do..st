execution callback
executeString: aString do: projectSpecBlock
  ((projectSpecGenerator projectSpecLookupBlock value: aString)
    select: self projectSpecSelectBlock)
    do: [ :projectSpec | projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ]