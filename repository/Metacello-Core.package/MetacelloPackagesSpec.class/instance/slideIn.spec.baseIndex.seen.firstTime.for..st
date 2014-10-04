accessing
slideIn: orderedSpecs spec: targetSpec baseIndex: baseIndex seen: seen firstTime: firstTime for: aVersionSpec
  | targetIndex requiredSpecs targetRequires targetRequiresIndexes minIndex baseSpec required |
  (seen includes: targetSpec)
    ifTrue: [ ^ false ].
  targetIndex := orderedSpecs indexOf: targetSpec.
  baseIndex >= targetIndex
    ifTrue: [ ^ false ].
  required := false.
  baseSpec := orderedSpecs at: baseIndex.
  baseIndex + 1 to: targetIndex - 1 do: [ :index | 
    | spec |
    spec := orderedSpecs at: index.
    ((spec requiredSpecNamesForPackageOrdering: aVersionSpec) includes: baseSpec)
      ifTrue: [ required := true ] ].
  firstTime
    ifFalse: [ 
      required
        ifFalse: [ ^ false ] ].
  requiredSpecs := targetSpec requiredSpecNamesForPackageOrdering: aVersionSpec.
  targetRequires := orderedSpecs
    select: [ :spec | requiredSpecs includes: spec ].
  targetRequiresIndexes := targetRequires
    collect: [ :spec | orderedSpecs indexOf: spec ].
  targetRequiresIndexes add: baseIndex.
  minIndex := targetRequiresIndexes detectMax: [ :each | each ].
  minIndex + 1 < targetIndex
    ifTrue: [ 
      orderedSpecs remove: targetSpec.
      orderedSpecs add: targetSpec afterIndex: minIndex.
      seen add: targetSpec ]
    ifFalse: [ 
      ^ self
        slideIn: orderedSpecs
        spec: (orderedSpecs at: minIndex)
        baseIndex: 1
        seen: seen
        firstTime: firstTime
        for: aVersionSpec ].
  ^ true