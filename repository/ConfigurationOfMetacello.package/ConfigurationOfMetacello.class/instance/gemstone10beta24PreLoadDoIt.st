doits
gemstone10beta24PreLoadDoIt
	"MetacelloGoferLoad>>addVersion: references an IV that no longer exists after version 292 of Metacello-MC"
	
	| wc ancestry versionNumber |
	wc := [((Smalltalk at: #GoferPackageReference) name: 'Metacello-MC') workingCopy] 
			on: Error 
			do: [:ex | ^self ].
	(ancestry := wc ancestry ancestors) isEmpty ifTrue: [ ^self ].
	versionNumber := (ancestry first name copyAfterLast: $.) asNumber.
	versionNumber > 292 ifTrue: [ ^self ].
	(Smalltalk at: #MetacelloGoferLoad)
		compileMethod: self gemstone10beta24PreLoadMethodString
		category: 'accessing'