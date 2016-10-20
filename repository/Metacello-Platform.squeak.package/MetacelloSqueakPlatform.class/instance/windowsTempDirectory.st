file system
windowsTempDirectory
	Smalltalk at: #OSProcess ifPresent: [:osProcess |
		^ osProcess thisOSProcess environment at: 'TMP'].
	(FileDirectory on: 'C:\Windows') exists
		ifTrue: [^ 'C:\Windows\Temp']
		ifFalse: [self error: 'Cannot determine temporary directory. Please install OSProcess.']