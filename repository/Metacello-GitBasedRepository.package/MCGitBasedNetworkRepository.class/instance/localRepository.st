private
localRepository
	^ localRepository ifNil: [ 
		self resolveLocalRespository.
		localRepository ]