accessing
versionWithInfo: aVersionInfo ifAbsent: errorBlock
	^ self localRepository 
		versionWithInfo: aVersionInfo 
		ifAbsent: errorBlock