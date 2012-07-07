user interaction
confirm: aString
	
	Smalltalk 
		at: #OBGemStonePlatform 
		ifPresent: [:cl | 
			(cl perform: #canConfirm)
				ifTrue: [
					Smalltalk 
						at: #OBConfirmationRequest 
						ifPresent: [:obClass |
							^obClass perform: #prompt:  with: aString ]]].
	Warning signal: aString.
	^true