as yet unclassified
defaultAction

	(UIManager default confirm: 'Tonel support is missing. Install from github://j4yk/tonel:squeak?')
		ifTrue: [
			Metacello new
				repository: 'github://j4yk/tonel:squeak';
				baseline: 'Tonel';
				load]
		ifFalse: [self error: 'Tonel support is missing.']