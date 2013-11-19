instance creation
new
	self name == #MetacelloMCAbstractProjectSpec
		ifTrue: [ self error: 'This class is abstract' ].
	^ super new