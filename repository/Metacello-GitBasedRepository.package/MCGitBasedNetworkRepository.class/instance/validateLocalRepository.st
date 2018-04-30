private
validateLocalRepository
	(MCFileTreeFileUtils current directoryExists: localRepository directory) ifTrue: [ ^ self ].
	self flushCache.
 	self resolveLocalRespository