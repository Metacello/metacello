*Metacello-GsCypress-MC
isPackageLoaded: aLoader
  
  MetacelloPlatform current 
    globalNamed: 'CypressPackageManager3'
    ifPresent: [:cl | ^cl isPackageLoaded: self file ].
  ^ false
