accessing
closestAncestorVersionFor: anAncestry ifNone: errorBlock
	^ self localRepository 
		closestAncestorVersionFor: anAncestry 
		ifNone: errorBlock