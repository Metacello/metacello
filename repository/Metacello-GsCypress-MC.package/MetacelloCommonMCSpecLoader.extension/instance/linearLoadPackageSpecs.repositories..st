*Metacello-GsCypress-MC
linearLoadPackageSpecs: packageSpecs repositories: repositories

  | packageManager summary |
  packageManager := CypressPackageManager3 new.
  repositories do: [:repo | packageManager addRepository: repo ].
  packageSpecs do: [ :spec |  spec loadUsing: self packageManager: packageManager ]
