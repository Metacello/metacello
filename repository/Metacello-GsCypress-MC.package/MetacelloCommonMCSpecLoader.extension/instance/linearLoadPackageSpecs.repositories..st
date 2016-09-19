*Metacello-GsCypress-MC
linearLoadPackageSpecs: packageSpecs repositories: repositories
  "Cheapo hack to just load the package right now ..."

  | repo packageManager summary |
  repo := repositories at: 1.
  packageManager := CypressPackageManager3 new.
  packageSpecs
            do: [ :spec | 
              summary := packageManager
                loadPackageFrom: (CypressPackageDefinition named: spec file)
                inRepository: repo.
              summary isEmpty
                ifFalse: [ self error: 'Could not load package named: ' , spec name printString ] ].
