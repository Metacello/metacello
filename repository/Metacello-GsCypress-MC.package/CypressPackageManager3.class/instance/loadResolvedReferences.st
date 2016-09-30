loading
loadResolvedReferences
  | cypressLoader |
  cypressLoader := CypressLoader new.
  cypressLoader defaultSymbolDictionaryName: self defaultSymbolDictionaryName.
  self resolvedReferences
    do: [ :resolvedReference | 
      | package repository snapshot |
      package := resolvedReference packageDefinition.
      repository := resolvedReference repository.
      snapshot := (repository readPackageStructureForPackageNamed: package name)
        snapshot.
      cypressLoader updatePackage: package withSnapshot: snapshot ].
  self halt.
  cypressLoader load.
  cypressLoader unloadable notEmpty
    ifTrue: [ self error: 'Unloadable definitions' ].
  cypressLoader errors notEmpty
    ifTrue: [ self error: 'Load errors' ].
  cypressLoader requirements notEmpty
    ifTrue: [ self error: 'Missing Requirements' ]