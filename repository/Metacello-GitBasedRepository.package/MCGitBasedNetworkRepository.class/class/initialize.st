initialization
initialize
  "self initialize"

	Smalltalk 
		at: #SessionManager
		ifPresent: [ :c | c default registerNetworkClassNamed: self name ]
		ifAbsent:[ Smalltalk addToStartUpList: self ].
  self flushDownloadCache.
  self resetCacheDirectoryIfInvalid