*Metacello-GsCypress-MC
linearLoadPackageSpecs: packageSpecs repositories: repositories

  | packageManager |
  packageManager := CypressPackageManager3 new.
  repositories do: [:repo | packageManager addRepository: repo ].
  packageSpecs do: [ :aSpec |  aSpec loadUsing: self packageManager: packageManager ]
