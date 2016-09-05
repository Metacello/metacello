*metacello-platform
asMetacelloCachingResolvedReference
  ^ (MetacelloPlatform current
    globalNamed: #'MetacelloCachingGoferResolvedReference')
    name: self name
    repository: self repository