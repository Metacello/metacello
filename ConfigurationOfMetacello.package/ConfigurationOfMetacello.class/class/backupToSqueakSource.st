metacello release process
backupToSqueakSource
	"In order for username and password to be set correctly, you must already have the metacello repository
	 set up"

	| cacheRepository version |
	cacheRepository := MCHttpRepository location: 'http://www.squeaksource.com/metacello' user: '' password: ''.
	"need to pick up existing repository with user and password set"
	cacheRepository := MCRepositoryGroup default repositories
		detect: [ :each | each = cacheRepository ]
		ifNone: [ cacheRepository ].
	version := self project latestVersion.
	version ignoreImage: true.
	(version record: 'ALL') loadDirective
		versionDirectivesDo: [ :versionDirective | 
			| p pClass |
			versionDirective spec ~~ nil
				ifTrue: [ 
					p := versionDirective spec project.
					pClass := p configuration class.	"save packages for Gofer and Metacello only"
					(pClass == (Smalltalk at: #ConfigurationOfGofer) or: [ pClass == self ])
						ifTrue: [ 
							| policy |
							policy := ((Smalltalk at: #MetacelloLoaderPolicy) new)
								cacheRepository: cacheRepository;
								ignoreImage: true;
								yourself.	"fetch Gofer or Metacello configuration"
							p fetchProject: policy.
							versionDirective
								packagesDo: [ :packageDirective | 
									"skip nested configurations"
									(packageDirective spec name beginsWith: 'ConfigurationOf')
										ifFalse: [ 
											"fetch mcz file"
											packageDirective spec fetchPackage: policy ] ] ] ] ]
					