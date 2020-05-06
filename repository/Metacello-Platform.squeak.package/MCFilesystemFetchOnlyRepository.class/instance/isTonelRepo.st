testing
isTonelRepo
	^ (self directory fileExists: '.properties') and: [
		self directory readOnlyFileNamed: '.properties' do: [:stream | ((STONJSON fromStream: stream) at: #format ifAbsent: []) = #tonel]]