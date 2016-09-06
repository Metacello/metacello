*metacello-monticello-platform
repositoryFromUrl: anUrl
  | locator scheme |
  locator := anUrl locator.
  scheme := anUrl scheme.
  scheme = 'filetree'
    ifTrue: [ ^ MCFileTreeRepository new directory: (ServerFileDirectory on: locator) ].
  self error: 'Unknown repostiroy scheme: ' , scheme printString