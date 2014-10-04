private
requiredSpecsForPackageOrdering: aVersionSpec
  | packageOrProjectSpecs |
  packageOrProjectSpecs := Set new.
  self requires
    do: [ :specName | 
      | spec |
      "get project/group/package specs"
      spec := aVersionSpec packageNamed: specName.
      packageOrProjectSpecs
        addAll: (spec requiresSpecsForPackageOrdering: aVersionSpec) ].
  ^ packageOrProjectSpecs