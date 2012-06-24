querying
currentlyLoadedClassesInVersion
	| classes |
	classes := Set new.
	self
		projectDo: [ :projectSpec |  classes addAll: projectSpec currentlyLoadedClassesInPackage]
		packageDo: [ :packageSpec |classes addAll: packageSpec currentlyLoadedClassesInPackage]
		groupDo: [ :ignored |  ].
	^ classes 