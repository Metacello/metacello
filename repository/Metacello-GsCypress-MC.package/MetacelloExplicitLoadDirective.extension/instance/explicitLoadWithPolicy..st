*Metacello-GsCypress-MC
explicitLoadWithPolicy: aLoadPolicy

  | packageManager |
  packageManager := CypressPackageManager3 new.
  self explicitLoadUsing: self packageManager: packageManager
