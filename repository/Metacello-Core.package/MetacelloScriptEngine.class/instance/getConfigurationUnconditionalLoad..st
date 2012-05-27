project lookup
getConfigurationUnconditionalLoad: unconditionalLoad
    | projectSpec |
    projectSpec := self configurationProjectSpec.
    Smalltalk
        at: projectSpec className asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (projectSpec := self lookupConfigurationProjectSpecFrom: projectSpec) projectPackage load.
    ^ Smalltalk at: projectSpec className asSymbol