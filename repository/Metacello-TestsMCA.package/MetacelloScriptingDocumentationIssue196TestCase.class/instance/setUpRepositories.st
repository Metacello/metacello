running
setUpRepositories
  | defaultDirectory |
  super setUpRepositories.
  Smalltalk
    at: #'Metacello_Configuration_Test_Repository'
    put: configurationRepository.
  defaultDirectory := MetacelloPlatform current defaultDirectory.
  alternateDirectory := MetacelloPlatform current
    directoryFromPath: self samplePath
    relativeTo: defaultDirectory.
  alternateDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: alternateDirectory ].
  MetacelloPlatform current ensureDirectoryExists: alternateDirectory