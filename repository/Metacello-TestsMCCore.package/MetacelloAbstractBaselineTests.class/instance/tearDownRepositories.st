running
tearDownRepositories
  (MetacelloPlatform current directoryExists: externalDirectory)
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ].
  (MetacelloPlatform current directoryExists: alternateDirectory)
    ifTrue: [ MetacelloPlatform current recursiveDelete: alternateDirectory ].
  self resourceClass current teardownRepositories: self tearDownRepositoryList