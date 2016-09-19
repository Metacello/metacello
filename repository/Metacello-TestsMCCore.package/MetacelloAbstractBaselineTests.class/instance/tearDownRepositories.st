running
tearDownRepositories
  MetacelloPlatform current
    directoryExists: externalDirectory
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ].
  self resourceClass current teardownRepositories: self tearDownRepositoryList