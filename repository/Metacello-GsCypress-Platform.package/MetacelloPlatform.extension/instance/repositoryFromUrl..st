*Metacello-GsCypress-Platform
repositoryFromUrl: anUrl
  | scheme |
  scheme := anUrl scheme.
  scheme = 'filetree'
    ifTrue: [ | locator |
      locator := anUrl locator.
      locator last = $/
        ifFalse: [ locator := locator , '/' ].
      ^ CypressAbstractRepository onUrl: ('cypress:' , locator) asUrl alias: '' ].
  self error: 'Unknown repository scheme: ' , scheme printString