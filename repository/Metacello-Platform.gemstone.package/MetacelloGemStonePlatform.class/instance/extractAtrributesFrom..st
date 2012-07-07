attributes
extractAtrributesFrom: gsVersion

	| tokens attributes attribute |
	attributes := { #gemstone }.
	tokens := gsVersion subStrings: $..
	attribute := ''.
	1 to: tokens size do: [:index | | token |
		(token := tokens at: index) isEmpty ifTrue: [ ^attributes ].
		attribute := attribute, token.
		attributes add: ('gs', attribute, '.x') asSymbol.
		attribute := attribute, '.'].
	^attributes