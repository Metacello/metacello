running
setUpRepositories
  | defaultDirectory |
  defaultDirectory := MetacelloPlatform current defaultDirectory.
  externalDirectory := MetacelloPlatform current
    directoryFromPath: self externalPath
    relativeTo: defaultDirectory.
  externalDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ].
  MetacelloPlatform current ensureDirectoryExists: externalDirectory