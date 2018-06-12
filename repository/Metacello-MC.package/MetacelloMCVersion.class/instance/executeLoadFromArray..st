private
executeLoadFromArray: anArray

	| loader |
	loader := MetacelloMCVersionSpecLoader on: self spec.
	loader required: anArray.
	loaderPolicy notNil ifTrue: [ loader loaderPolicy: loaderPolicy ].
	^loader load