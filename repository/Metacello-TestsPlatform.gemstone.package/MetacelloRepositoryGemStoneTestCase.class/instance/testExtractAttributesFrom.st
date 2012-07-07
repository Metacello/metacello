tests
testExtractAttributesFrom

	| platform input output result |
	platform := MetacelloGemStonePlatform new.
	input := {
		'2.4.5'.
		'2.5'.
		'2.4.4.1'.
		'2'.
		'2.'.
		''.
		}.
	output := { 
		#( #'gemstone' #'gs2.x' #'gs2.4.x' #'gs2.4.5.x').
		#( #'gemstone' #'gs2.x' #'gs2.5.x' ).
		#( #'gemstone' #'gs2.x' #'gs2.4.x' #'gs2.4.4.x' #'gs2.4.4.1.x').
		#( #'gemstone' #'gs2.x' ).
		#( #'gemstone' #'gs2.x' ).
		#( #'gemstone' ).
		}.
	1 to: input size do: [:index |
		result := platform extractAtrributesFrom: (input at: index).
		self assert: result = (output at: index) ].