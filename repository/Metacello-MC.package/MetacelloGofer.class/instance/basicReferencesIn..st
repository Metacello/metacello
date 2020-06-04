private
basicReferencesIn: aRepository
	((aRepository respondsTo: #cacheReferences) not or: [aRepository cacheReferences not])
		ifTrue: [^ super basicReferencesIn: aRepository ].
	"Use cache for network-based repositories - the contents of repository is cached based on first access 
	 and is _not_ updated afterword, so any mcz files added after the initial cache is created won't be seen"
	^ MetacelloPlatform current
		stackCacheFor: #goferRepository
		cacheClass: IdentityDictionary
		at: aRepository
		doing: [ :cache | 
			^ cache at: aRepository put: (super basicReferencesIn: aRepository) ]