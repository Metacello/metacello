project lookup
getConfigurationUnconditionalLoad: unconditionalLoad
  | spec |
  spec := self projectSpec.
  MetacelloPlatform current
    globalNamed: spec className asSymbol
    ifPresent: [ :cl | 
      unconditionalLoad
        ifFalse: [ ^ cl ] ].
  (spec := self lookupProjectSpecFor: spec) projectPackage load.
  ^ MetacelloPlatform current globalNamed: spec className asSymbol
