execution callback
executeBlock: selectBlock do: projectSpecBlock
    ((projectSpecGenerator projectSpecListBlock value select: selectBlock) select: self projectSpecSelectBlock)
        do: projectSpecBlock