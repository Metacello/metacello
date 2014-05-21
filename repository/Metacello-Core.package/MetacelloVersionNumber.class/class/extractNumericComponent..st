private
extractNumericComponent: subString
	"$. separated components are integers"

	| number |
	number := [subString asNumber] 
						on: Error, Warning
						do: [:ex | ex return: subString ].
	^number asString = subString
		ifTrue: [ number ]
		ifFalse: [ subString ]