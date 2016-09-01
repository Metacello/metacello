*metacello-mc
registerPackageNamed: packageName
  ^ (Smalltalk at: #'PackageInfo') registerPackageName: packageName