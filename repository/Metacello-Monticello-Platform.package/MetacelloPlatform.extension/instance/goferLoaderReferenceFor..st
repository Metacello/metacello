*metacello-monticello-platform
goferLoaderReferenceFor: aMetacelloPackageSpec
  ^ aMetacelloPackageSpec getFile == nil
    ifTrue: [ GoferPackageReference name: aMetacelloPackageSpec name ]
    ifFalse: [ 
      "does Monticello-style #versionInfoFromVersionNamed: matching"
      self metacelloGoferPackageFor: aMetacelloPackageSpec ]