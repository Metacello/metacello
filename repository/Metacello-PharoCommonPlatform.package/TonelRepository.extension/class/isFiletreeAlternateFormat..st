*Metacello-PharoCommonPlatform
isFiletreeAlternateFormat: aRepositorySpec
	| location propRef |
	
	location := (aRepositorySpec description allButFirst: ('filetree://' size)) asFileReference.
	propRef := location / '.properties'.
	propRef exists ifFalse: [ ^ false ].
	
	^ propRef readStreamDo:[ :stream | 
		((STONJSON fromStream: stream) at: #format ifAbsent: []) = #tonel ]