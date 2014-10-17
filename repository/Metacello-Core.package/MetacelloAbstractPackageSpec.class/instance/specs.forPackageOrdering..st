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
                ,
                  ' not found when used in requires: or includes: field of package: '
                , self name printString , ' for version: '
                , aVersionSpec versionString , ' of '
                , aVersionSpec projectLabel , '.' ].
      packageOrProjectSpecs
        addAll: (spec resolveSpecsForPackageOrdering: aVersionSpec) ].
  ^ packageOrProjectSpecs