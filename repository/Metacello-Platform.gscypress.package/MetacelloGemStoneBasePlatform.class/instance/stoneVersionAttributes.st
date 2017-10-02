attributes
stoneVersionAttributes
  ^ stoneVersionAttribute
    ifNil: [ 
      stoneVersionAttribute := self
        extractAtrributesFrom: (System stoneVersionAt: 'gsVersion') ]
