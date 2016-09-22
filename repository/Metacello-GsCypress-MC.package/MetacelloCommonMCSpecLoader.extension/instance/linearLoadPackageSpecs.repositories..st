*Metacello-GsCypress-MC
linearLoadPackageSpecs: packageSpecs repositories: repositories

  | packageManager summary |
  packageManager := CypressPackageManager3 new.
  repositories do: [:repo | packageManager add: repo ].
  packageSpecs do: [ :spec |  pkg loadUsing: self packageManager: packageManager ]
