file system
tempFileFor: aName suffix: aSuffixString
	^ (Smalltalk os platformName = 'Win32'
		ifTrue: [OSProcess thisOSProcess environment at: 'TMP']
		ifFalse: ['/tmp']) , FileDirectory slash , aName , aSuffixString