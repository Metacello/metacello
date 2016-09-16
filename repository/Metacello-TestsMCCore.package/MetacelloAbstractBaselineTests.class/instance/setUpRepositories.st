running
setUpRepositories
  | defaultDirectory |
  defaultDirectory := MetacelloPlatform current defaultDirectory.
  externalDirectory := MetacelloPlatform current
    directoryFromPath: self externalPath
    relativeTo: defaultDirectory.
  (MetacelloPlatform current directoryExists: externalDirectory)
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ].
  MetacelloPlatform current ensureDirectoryExists: externalDirectory