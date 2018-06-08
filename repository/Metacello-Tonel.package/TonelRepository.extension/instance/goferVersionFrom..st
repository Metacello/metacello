*Metacello-Tonel
goferVersionFrom: aVersionReference
	"Simillar hack than FileTree repositories."

	((self readableFileNames collect: [ :fileName | self fileDirectoryOn: fileName ])
		select: [ :packageDirectory | self fileUtils directoryExists: packageDirectory ])
		collect: [ :packageDirectory | 
			(self versionInfoForPackageDirectory: packageDirectory) name = aVersionReference name
				ifTrue: [ ^ self loadVersionFromFileNamed: (self fileUtils directoryName: packageDirectory) ] ].
	^ nil