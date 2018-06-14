private
ensureLocalRepository
	localRepository ifNotNil: [ ^ self ].
	self resolveLocalRespository