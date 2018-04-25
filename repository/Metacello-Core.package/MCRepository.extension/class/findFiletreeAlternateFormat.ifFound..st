*Metacello-Core
findFiletreeAlternateFormat: aRepositorySpec ifFound: aBlock
	^ self allSubclasses 
		detect: [ :each | each isFiletreeAlternateFormat: aRepositorySpec ]
		ifFound: aBlock