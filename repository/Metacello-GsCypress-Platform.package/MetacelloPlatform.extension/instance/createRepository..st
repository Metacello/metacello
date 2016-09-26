*Metacello-GsCypress-Platform
createRepository: aRepositorySpec
  aRepositorySpec type = 'globalrepo'
    ifTrue: [ 
      | url |
      "primarily used for testing"
      url := aRepositorySpec description asUrl.
      ^ self repositoryFromUrl: (self globalNamed: url locator) asUrl ].
  ^ self repositoryFromUrl: aRepositorySpec description asUrl