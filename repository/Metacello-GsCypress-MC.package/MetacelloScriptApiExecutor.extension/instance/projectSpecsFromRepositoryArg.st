*Metacello-GsCypress-MC
projectSpecsFromRepositoryArg
  | spec repo projectSpecs |
  repositoryArg ifNil: [ ^ #() ].
  spec := (projectSpecGenerator projectSpecCreationBlock value: 'xxx') first.
  repo := spec project
    createRepository: (spec project repositorySpec description: repositoryArg).
  projectSpecs := OrderedCollection new.
  ((CypressPackageManager3 new
    addRepository: repo;
    allResolvedPackageReferences)
    collect: [ :resolvedReference | resolvedReference packageName ]) asSet
    do: [ :packageName | 
      (projectSpecGenerator projectSpecCreationBlock
        value: (MetacelloScriptEngine baseNameOf: packageName))
        do: [ :projectSpec | 
          projectSpec className = packageName
            ifTrue: [ projectSpecs add: (self applyArgsToProjectSpec: projectSpec copy) ] ] ].
  ^ projectSpecs