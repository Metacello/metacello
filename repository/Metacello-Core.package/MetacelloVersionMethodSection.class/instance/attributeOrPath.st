accessing
attributeOrPath
	| path |
	^self parent == nil
		ifTrue: [ self attribute ]
		ifFalse: [ self parent attributePath , {(self attribute)} ]