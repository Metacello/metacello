project lookup
getConfigurationUnconditionalLoad: unconditionalLoad
    | packageSpec |
    Smalltalk
        at: self projectPackageSpec file asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (packageSpec := self lookupConfigurationPackageSpecFrom: self projectPackageSpec) load.
    ^ Smalltalk at: packageSpec file asSymbol