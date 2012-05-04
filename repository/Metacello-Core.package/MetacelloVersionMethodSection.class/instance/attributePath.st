accessing
attributePath
	| path |
	path := {self attribute.}.
	^self parent == nil
		ifTrue: [ path ]
		ifFalse: [ self parent attributePath , path ]