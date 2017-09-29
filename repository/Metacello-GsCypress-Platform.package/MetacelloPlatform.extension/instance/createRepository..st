*Metacello-GsCypress-Platform
createRepository: aRepositorySpec
  aRepositorySpec type = 'globalrepo'
    ifTrue: [ 
      | url |
      "primarily used for testing"
      url := CypressUrl absoluteFromText: aRepositorySpec description.
      ^ self repositoryFromUrl: (CypressUrl absoluteFromText: (self globalNamed: url locator)) ].
  ^ self repositoryFromUrl: (CypressUrl absoluteFromText: aRepositorySpec description)
