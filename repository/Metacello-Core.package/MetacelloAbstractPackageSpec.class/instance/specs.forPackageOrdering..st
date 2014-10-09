private
specs: specNames forPackageOrdering: aVersionSpec
  | packageOrProjectSpecs |
  packageOrProjectSpecs := Set new.
  specNames
    do: [ :specName | 
      | spec |
      "get project/group/package specs"
      spec := aVersionSpec packageNamed: specName.
      packageOrProjectSpecs
        addAll: (spec resolveSpecsForPackageOrdering: aVersionSpec) ].
  ^ packageOrProjectSpecs