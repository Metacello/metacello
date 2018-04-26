*Metacello-Core
newRepositoryFromSpec: aRepositorySpec on: aPlatform
	self allSubclasses 
		detect: [ :each  | each isAvailableFor: aRepositorySpec type ]
		ifFound: [ :each | ^ each createRepositoryFromSpec: aRepositorySpec on: aPlatform ].
		
	self error: 'Unknown repository type: ', aRepositorySpec description