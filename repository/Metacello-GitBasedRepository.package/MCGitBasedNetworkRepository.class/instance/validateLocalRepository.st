private
validateLocalRepository
	| dir |

	dir := self calculateRepositoryDirectory.
	(dir = localRepository directory 
		and: [ MCFileTreeFileUtils current directoryExists: dir ]) 
		ifTrue: [ ^ self ].
	self flushCache.
 	self resolveLocalRespository.