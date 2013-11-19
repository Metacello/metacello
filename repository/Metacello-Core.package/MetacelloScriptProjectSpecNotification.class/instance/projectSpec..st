accessing
projectSpec: anObject
	(anObject class inheritsFrom: MetacelloMCAbstractProjectSpec)
		ifFalse: [ self error: 'Unexpected instance of ' , anObject class , ' expected a subclass of MetacelloMCAbstractProjectSpec' ].
	projectSpec := anObject