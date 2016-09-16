*Metacello-GsCypress-Platform
repositoryFromUrl: anUrl
  | locator scheme |
  locator := anUrl locator.
  scheme := anUrl scheme.
  scheme = 'filetree'
    ifTrue: [ 
      locator last = $/ ifFalse: [ locator := locator, '/' ].
      ^ CypressAbstractRepository
        onUrl: ('cypress:' , locator) asUrl
        alias: 'Metacello repository' ].
  self error: 'Unknown repository scheme: ' , scheme printString