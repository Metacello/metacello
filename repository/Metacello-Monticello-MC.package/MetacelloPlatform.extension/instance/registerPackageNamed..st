*metacello-monticello-mc
registerPackageNamed: packageName
  ^ (self globalNamed: #'PackageInfo') registerPackageName: packageName