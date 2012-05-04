adding
findMethodSection: attributeOrPath
	| attribute index sections found |
	attributeOrPath isArray
		ifTrue: [ attribute := attributeOrPath last ]
		ifFalse: [ attribute := attributeOrPath ].
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
									index == (attributeOrPath size - 1)
										ifTrue: [ ^ ms ].
									sections := ms methodSections.
									index := index + 1.
									found := true ] ] ].
			self error: 'Method section for attribute: ' , (attributeOrPath at: index) printString , ' not found.' ]
		ifFalse: [ 
			^ self methodSections
				detect: [ :methodSection | methodSection attribute == attribute ]
				ifNone: [ self error: 'Method section for attribute: ' , attribute printString , ' not found.' ] ]