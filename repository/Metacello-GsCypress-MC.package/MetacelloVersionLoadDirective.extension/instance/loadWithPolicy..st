*Metacello-GsCypress-MC
loadWithPolicy: aLoadPolicy
  | packageManager |
  packageManager := CypressPackageManager3 new.
  self loadUsing: self packageManager: packageManager