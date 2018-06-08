accessing
goferReferences
	"delegate collection to local repository, but change them to be from *this* repository."

	^ self localRepository goferReferences 
		collect: [ :each | GoferResolvedReference name: each name repository: self ]