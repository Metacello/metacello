private
matches: aLoadableReference
	"does Monticello-style #versionInfoFromVersionNamed: matching"

	| pFilename refName char |
	((pFilename := self packageFilename) == nil or: [ self name = self packageFilename ])
		ifTrue: [ ^ super matches: aLoadableReference ].
	aLoadableReference name = pFilename
		ifTrue: [ ^ true ].
	(aLoadableReference name beginsWith: pFilename)
		ifFalse: [ ^ false ].
	refName := aLoadableReference packageName.
	refName = pFilename
		ifTrue: [ ^ true ].
	pFilename size < refName size
		ifTrue: [ 
			(refName beginsWith: pFilename)
				ifFalse: [ ^ false ].
			(char := pFilename at: pFilename size) ~= $-
				ifTrue: [ char := refName at: pFilename size + 1 ] ]
		ifFalse: [ 
			(pFilename beginsWith: refName)
				ifFalse: [ ^ false ].
			(char := refName at: refName size) ~= $-
				ifTrue: [ char := pFilename at: refName size + 1 ] ].
	^ char = $. or: [ char = $- ]