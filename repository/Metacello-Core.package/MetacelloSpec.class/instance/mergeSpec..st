merging
mergeSpec: aSpec
  | newSpec nonOverridable platform |
  self validateMergeForSpec: aSpec.
  newSpec := self copy.
  nonOverridable := self nonOverridable.
  platform := MetacelloPlatform current.
  aSpec mergeMap
    keysAndValuesDo: [ :key :value | 
      (nonOverridable includes: key)
        ifFalse: [ 
          value ~~ nil
            ifTrue: [ platform object: newSpec atInstVarNamed: key asString put: value ] ] ].
  ^ newSpec
