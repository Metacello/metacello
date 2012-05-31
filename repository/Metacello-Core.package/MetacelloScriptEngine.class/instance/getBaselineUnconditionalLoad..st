project lookup
getBaselineUnconditionalLoad: unconditionalLoad
    | spec |
    spec := self projectSpec asBaselineProjectSpec.
    Smalltalk
        at: spec className asSymbol
        ifPresent: [ :cl | 
            unconditionalLoad
                ifFalse: [ ^ cl ] ].
    (spec := self lookupBaselineProjectSpecFrom: spec) projectPackage load.
    ^ Smalltalk at: spec className asSymbol