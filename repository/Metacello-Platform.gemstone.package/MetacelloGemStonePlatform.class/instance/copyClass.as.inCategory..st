reflection
copyClass: oldClass as: newName inCategory: newCategoryName

	| definition newClass |
	Smalltalk at: newName asSymbol ifPresent: [^ self error: newName , ' already exists'].
	definition := oldClass 
						definitionWithClassName: newName asSymbol
						superClassName: (oldClass superClass == nil 
							ifTrue: ['nil'] ifFalse: [oldClass superClass name]).
	definition := definition copyReplaceAll: 'category: ', oldClass category asString printString with: 'category: ', newCategoryName printString.
	newClass := definition evaluate.
	newClass 
		copyMethodsFrom: oldClass 
		dictionaries: GsSession currentSession symbolList.
	^ newClass