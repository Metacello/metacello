private
localRepository
	localRepository ifNil: [ self resolveLocalRespository ].
	self validateLocalRepository.
	^ localRepository