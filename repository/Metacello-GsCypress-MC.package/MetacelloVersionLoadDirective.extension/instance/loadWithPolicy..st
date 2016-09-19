*Metacello-GsCypress-MC
loadWithPolicy: aLoadPolicy

  | packageManager |
  packageManager := CypressPackageManager2 new.
  self loadUsing: self packageManager: packageManager
