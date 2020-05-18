priv handling
defaultAction

	(UIManager default confirm: 'Tonel support is missing. Install from github://squeak-smalltalk/squeak-tonel:squeak?')
		ifTrue: [
			Metacello new
				repository: 'github://squeak-smalltalk/squeak-tonel:squeak';
				baseline: 'Tonel';
				load]
		ifFalse: [self error: 'Tonel support is missing.']