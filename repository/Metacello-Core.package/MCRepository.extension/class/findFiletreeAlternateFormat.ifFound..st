*Metacello-Core
findFiletreeAlternateFormat: aRepositorySpec ifFound: aBlock
findFiletreeAlternateFormat: aRepositorySpec ifFound: aBlock
	| repositoryClass |
	repositoryClass := self allSubclasses detect: [ :each | each isFiletreeAlternateFormat: aRepositorySpec ] ifNone: [ nil ].
	
	^ repositoryClass ifNotNil: [ aBlock cull: repositoryClass ]