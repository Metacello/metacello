repository setup
setUpRepositoryContents: packageList sourceRepo: sourceRepo targetRepo: targetRepo
  packageList
    do: [ :packageName | 
      | packageStructure |
      packageStructure := sourceRepo
        readPackageStructureForPackageNamed: packageName.
      targetRepo writePackageStructure: packageStructure ]