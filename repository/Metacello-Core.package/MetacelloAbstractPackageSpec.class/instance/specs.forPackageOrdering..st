private
specs: specNames forPackageOrdering: aVersionSpec
  | packageOrProjectSpecs |
  packageOrProjectSpecs := Set new.
  specNames
    do: [ :specName | 
      | spec |
      "get project/group/package specs"
      spec := aVersionSpec
        packageNamed: specName
        ifAbsent: [ 
          self
            error:
              'project group, or package named: ' , specName printString
                , ' not found for version: ' , aVersionSpec versionString
                , ' of ' , aVersionSpec projectLabel , '.' ].
      packageOrProjectSpecs
        addAll: (spec resolveSpecsForPackageOrdering: aVersionSpec) ].
  ^ packageOrProjectSpecs