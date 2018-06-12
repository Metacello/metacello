repository creation
createDictionaryRepository: aRepositorySpec
	| description headerSize globalName |
 
	description := aRepositorySpec description.
	headerSize := 'dictionary://' size.
	globalName := (description copyFrom: headerSize + 1 to: description size) asSymbol.
   
	^ Smalltalk
 		at: globalName
 		ifAbsent: [ 
          Smalltalk
            at: globalName
            put: (MCDictionaryRepository new
					description: description;
					yourself) ]