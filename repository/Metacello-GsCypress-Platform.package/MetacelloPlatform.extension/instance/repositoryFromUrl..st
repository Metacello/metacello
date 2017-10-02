*Metacello-GsCypress-Platform
repositoryFromUrl: anUrl
  | scheme |
  scheme := anUrl scheme.
  scheme = 'filetree'
    ifTrue: [ | locator |
      locator := anUrl locator.
      locator last = $/
        ifFalse: [ locator := locator , '/' ].
      ^ CypressAbstractRepository onUrl: (CypressUrl absoluteFromText: 'cypresslax:' , locator) alias: '' ].
  self error: 'Unknown repository scheme: ' , scheme printString
