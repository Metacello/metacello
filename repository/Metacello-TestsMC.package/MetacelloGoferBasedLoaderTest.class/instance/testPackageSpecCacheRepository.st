cache repository
testPackageSpecCacheRepository
	| project version loader cacheRepository files |
	project := self project.
	version := project version: 'Issue77-baseline'.
	version cacheRepository: (cacheRepository := MCDictionaryRepository new).
	loader := version fetch.
	self assert: cacheRepository dictionary size = 7.
	#('GoferBar-lr.1' 'GoferBeau-dkh.53' 'GoferFoo-lr.1' 'GoferFoo-lr.4' 'MetacelloTestConfigurationOfIssue77B-dkh.1' 'MetacelloTestConfigurationOfIssue77C-dkh.1' 'MetacelloTestConfigurationOfIssue77D-dkh.1')
		do: [ :file | self assert: (cacheRepository includesVersionNamed: file) ].
	files := #('MetacelloTestConfigurationOfIssue77B-dkh.1' 'MetacelloTestConfigurationOfIssue77D-dkh.1' 'MetacelloTestConfigurationOfIssue77C-dkh.1' 'GoferFoo-lr.1' 'GoferBeau-dkh.53' 'GoferFoo-lr.4' 'GoferBar-lr.1')
		asOrderedCollection.
	loader loadDirective
		packageDirectivesDo: [ :pkgDirective | 
			| file |
			file := pkgDirective file.
			self assert: (files indexOf: file) = 1.
			files remove: file ifAbsent: [ self assert: false ] ].
	self assert: files isEmpty