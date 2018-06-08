*Metacello-Core
newRepositoryFromSpec: aRepositorySpec on: aPlatform
	| repositoryClass |
	repositoryClass := self allSubclasses
		detect: [ :each | each isAvailableFor: aRepositorySpec type ]
		ifNone: [ self error: 'Unknown repository type: ' , aRepositorySpec description ].
		
	^ repositoryClass createRepositoryFromSpec: aRepositorySpec on: aPlatform