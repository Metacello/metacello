private
methodSection: methodSection inEvaluationOrder: attributes do: aBlock

	| selected |
	selected := OrderedCollection new.
	attributes
		do: [ :attribute | 
			methodSection methodSections
				do: [ :ms | 
					attribute == ms attribute
						ifTrue: [ selected add: ms ] ] ].
	selected do: aBlock.
	attributes size == 1
		ifTrue: [ ^ self ].
	selected
		do: [ :ms | self methodSection: ms inEvaluationOrder: (attributes copyFrom: 2 to: attributes size) do: aBlock ]