*metacello-monticello-platform
repositoryFromUrl: anUrl
  | locator scheme |
  locator := anUrl locator.
  scheme := anUrl scheme.
  scheme = 'filetree'
    ifTrue: [ 
      ^ MCFileTreeRepository new
        directory:
          (ServerFileDirectory on: (locator copyFrom: 3 to: locator size)) ].
  self error: 'Unknown repository scheme: ' , scheme printString