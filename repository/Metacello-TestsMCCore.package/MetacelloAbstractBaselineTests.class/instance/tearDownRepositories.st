running
tearDownRepositories
  externalDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ].
  self resourceClass current teardownRepositories: self tearDownRepositoryList