*Metacello-GsCypress-MC
isPackageLoaded: aPackageName

  ^ (CypressPackageDefinition named: aPackageName) snapshot definitions isEmpty not
