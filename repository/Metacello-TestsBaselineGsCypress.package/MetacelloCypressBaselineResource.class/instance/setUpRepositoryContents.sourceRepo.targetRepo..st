repository setup
setUpRepositoryContents: packageList sourceRepo: packageStructureMap targetRepo: targetRepo
  packageList
    do: [ :packageName | 
      | packageStructure |
      packageStructure := packageStructureMap at: packageName ]