api actions
load: required
	(self hasStatement: #cacheRepository:)
		ifTrue: [ Warning
				signal:
					'You should not load with a cacheRepository defined.  #cacheRepository: should only be used during a #fetch. Some packages and projects will not be loaded, if they''re already in the cache.' ].
	^ self execute: #load: args: {required}