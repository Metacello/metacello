project lookup
getConfigurationUnconditionalLoad: unconditionalLoad
    | spec |
    spec := self halt configurationProjectSpec.
    Smalltalk
        at: spec className asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (spec := self lookupConfigurationProjectSpecFrom: spec) projectPackage load.
    ^ Smalltalk at: spec className asSymbol