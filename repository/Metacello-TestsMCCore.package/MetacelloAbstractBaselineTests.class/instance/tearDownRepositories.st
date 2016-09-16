running
tearDownRepositories
  externalDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ]