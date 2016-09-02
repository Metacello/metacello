*metacello-mc
registerPackageNamed: packageName
  ^ (self globalNamed: #'PackageInfo') registerPackageName: packageName