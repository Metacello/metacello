private
baselineOfResolverBlock
    ^ [ :versionSpec :pragma | 
    (pragma argumentAt: 1) = versionSpec versionString
        ifTrue: [ 
            versionSpec baselineBaseName: (pragma argumentAt: 2).
            self evaluatePragma: pragma.
            self project attributes
                do: [ :attribute | 
                    | blockList |
                    (blockList := self attributeMap at: attribute ifAbsent: [  ]) ~~ nil
                        ifTrue: [ blockList do: [ :block | self with: versionSpec during: block ] ] ] ] ]