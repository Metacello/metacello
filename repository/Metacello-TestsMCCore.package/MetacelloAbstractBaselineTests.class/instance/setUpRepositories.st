running
setUpRepositories
  | defaultDirectory |
  defaultDirectory := MetacelloPlatform current defaultDirectory.
  externalDirectory := MetacelloPlatform current
    directoryFromPath: self externalPath
    relativeTo: defaultDirectory.
  (MetacelloPlatform current directoryExists: externalDirectory)
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ].
  MetacelloPlatform current ensureDirectoryExists: externalDirectory.
  alternateDirectory := MetacelloPlatform current
    directoryFromPath: self alternatePath
    relativeTo: defaultDirectory.
  (MetacelloPlatform current directoryExists: alternateDirectory)
    ifTrue: [ MetacelloPlatform current recursiveDelete: alternateDirectory ].
  MetacelloPlatform current ensureDirectoryExists: alternateDirectory