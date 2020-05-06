testing
isTonelRepo
	^ (self directory fileExists: '.properties') and: [
		self directory readOnlyFileNamed: '.properties' do: [:stream |
			Smalltalk
				at: #STONJSON
				ifPresent: [:stonjson | ((stonjson fromStream: stream) at: #format ifAbsent: [nil]) = #tonel]
				ifAbsent: [
					" this is not at all accurate, but will likely suffice until the user installs the proper support "
					stream contents includes: '#tonel']]]