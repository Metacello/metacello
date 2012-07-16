execution callback
executeBlock: selectBlock do: projectSpecBlock
    (projectSpecGenerator projectSpecListBlock value select: selectBlock)
        do: [ :projectSpec | projectSpecBlock value: (self applyArgsToProjectSpec: projectSpec copy) ]