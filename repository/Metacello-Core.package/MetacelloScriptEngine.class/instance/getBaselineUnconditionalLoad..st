project lookup
getBaselineUnconditionalLoad: unconditionalLoad
    | packageSpec |
    Smalltalk
        at: self projectBaselinePackageSpec file asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (packageSpec := self lookupBaselinePackageSpecFrom: self projectBaselinePackageSpec) load.
    ^ Smalltalk at: packageSpec file asSymbol