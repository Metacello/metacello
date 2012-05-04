tests
testBaseline10
	| wc project loader |
	project := self class new project.
	loader := project load: '1.0-baseline'.
	wc := (GoferPackageReference name: 'GoferBar') workingCopy.
	self assert: (wc ancestry ancestors first name = 'GoferBar-dkh.70').
