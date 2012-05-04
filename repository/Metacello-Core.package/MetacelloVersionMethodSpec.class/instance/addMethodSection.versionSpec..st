adding
addMethodSection: attributeOrPath versionSpec: versionSpec
	| attribute methodSection index sections found |
	attributeOrPath isArray
		ifTrue: [ attribute := attributeOrPath last ]
		ifFalse: [ attribute := attributeOrPath ].
	methodSection := (MetacelloVersionMethodSection new)
		attribute: attribute;
		versionSpec: versionSpec;
		yourself.
	attributeOrPath isArray
		ifTrue: [ 
			index := 1.
			sections := self methodSections.
			found := true.
			[ found ]
				whileTrue: [ 
					found := false.
					sections
						do: [ :ms | 
							ms attribute == (attributeOrPath at: index)
								ifTrue: [ 
									index == (attributeOrPath size -1 )
										ifTrue: [ 
											ms methodSections add: methodSection.
											^ self ].
									sections := ms methodSections.
									index := index + 1.
									found := true ] ] ].
			self error: 'Method section for attribute: ' , (attributeOrPath at: index) printString , ' not found.' ]
		ifFalse: [ self methodSections add: methodSection ]