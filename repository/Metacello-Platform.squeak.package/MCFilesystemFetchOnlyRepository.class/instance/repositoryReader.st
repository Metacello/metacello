private
repositoryReader
	
	" try accessing the directory once to make sure it exists "
	self directory.
	
	^ repositoryReader ifNil: [
		repositoryReader := self isTonelRepo
			ifTrue: [
				Smalltalk
					at: #TonelRepository
					ifPresent: [: cl | cl new directory: self directory]
					ifAbsent: [
						MCTonelMissing new signal.
						" if the user confirmed our request to install, we can try again "
						(Smalltalk at: #TonelRepository) directory: self directory]]
			ifFalse: [MCFileTreeRepository new directory: self directory]]