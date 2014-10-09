accessing
applyIncludesTo: orderedSpecs for: pkgSpec firstTime: firstTime for: aVersionSpec
  | movedSpecs baseIndex includedSpec result |
  movedSpecs := Set new.
  baseIndex := orderedSpecs indexOf: pkgSpec.
  (pkgSpec includeSpecNamesForPackageOrdering: aVersionSpec)
    do: [ :includedSpec | 
      | includedSpecName spec |
      includedSpecName := includedSpec name.
      spec := orderedSpecs
        detect: [ :spec | spec name = includedSpecName ]
        ifNone: [  ].
      (self
        slideIn: orderedSpecs
        spec: spec
        baseIndex: baseIndex
        seen: IdentitySet new
        firstTime: firstTime
        for: aVersionSpec)
        ifTrue: [ movedSpecs add: spec name ] ].
  ^ movedSpecs