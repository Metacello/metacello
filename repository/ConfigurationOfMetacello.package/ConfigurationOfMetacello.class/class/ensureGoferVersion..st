deprecated
ensureGoferVersion: goferVersion
	"load the p=file goferVersion if Gofer isn't loaded or an earlier version of Gofer is currently loaded"
	
	 | goferVersionNumber goferRepository wc pName |
	self deprecated: 'Use #ensureGoferVersion:repositoryUrl: instead ... '.
	goferRepository := 'http://seaside.gemstone.com/ss/metacello'.
	(Smalltalk at: #Gofer ifAbsent: []) == nil
		ifTrue: [ ^self bootstrapPackage: goferVersion from: goferRepository ].
	goferVersionNumber := (goferVersion copyAfterLast: $.) asNumber.
	wc := [ ((Smalltalk at: #GoferPackageReference) name: 'Gofer') workingCopy ]
			on: Error
			do: [:ex | ex return: ((Smalltalk at: #GoferPackageReference) name: 'Gofer-Core') workingCopy ].
	pName := wc ancestry ancestors first name.
	(pName copyAfterLast: $.) asNumber <= goferVersionNumber
		ifTrue: [ self bootstrapPackage: goferVersion from: goferRepository ]
