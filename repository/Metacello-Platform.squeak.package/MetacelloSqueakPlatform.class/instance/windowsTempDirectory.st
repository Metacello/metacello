file system
windowsTempDirectory
	Smalltalk at: #OSProcess ifPresent: [:osProcess |
		^ osProcess thisOSProcess environment at: 'TMP'].
	(FileDirectory on: 'C:\Windows') exists
		ifTrue: ["C:\Windows\Temp is writable, but not listable and #exists answers false for it"
			"create a subdirectory in it (for which #exists will answer true) and use that"
			(FileDirectory on: 'C:\Windows\Temp') createDirectory: 'Metacello'.
			^ 'C:\Windows\Temp\Metacello']
		ifFalse: [self error: 'Cannot determine temporary directory. Please install OSProcess.']