monticello
goferLoaderReferenceFor: aMetacelloPackageSpec
  ^ aMetacelloPackageSpec getFile == nil
    ifTrue: [ GoferPackageReference name: aMetacelloPackageSpec name ]
    ifFalse: [ 
      "does Monticello-style #versionInfoFromVersionNamed: matching"
      MetacelloGoferPackage
        name: aMetacelloPackageSpec name
        packageFilename: aMetacelloPackageSpec file ]