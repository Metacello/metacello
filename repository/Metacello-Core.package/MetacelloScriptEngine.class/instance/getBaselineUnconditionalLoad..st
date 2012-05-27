project lookup
getBaselineUnconditionalLoad: unconditionalLoad
    | projectSpec |
    projectSpec := self baselineProjectSpec.
    Smalltalk
        at: projectSpec className asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (projectSpec := self lookupBaselineProjectSpecFrom: projectSpec) projectPackage load.
    ^ Smalltalk at: projectSpec className asSymbol