attributes
stoneVersionAttributes

	stoneVersionAttribute isSymbol ifTrue: [ stoneVersionAttribute := nil ].
	stoneVersionAttribute ifNil: [ | atts |
				stoneVersionAttribute := self extractAtrributesFrom: (System stoneVersionAt: 'gsVersion').
				(Globals at: #RubySystemExit otherwise:nil) ~~ nil
					ifTrue: [ stoneVersionAttribute add: #'maglev' ]].
	^ stoneVersionAttribute