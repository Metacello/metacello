repository teardown
unloadPackages: packageList

  | packageManager |
  packageManager := CypressPackageManager3 new.
  packageList
    do: [:packageName |
      packageManager unloadPackageNamed: packageName ].
