validation
validateVersion: versionStringOrSymbol
	| issues |
	issues := (MetacelloMCVersionValidator validateProject: project version: versionStringOrSymbol)
		select: [ :issue | issue isError ].
	issues notEmpty
		ifTrue: [ self error: 'There are error issues with version ' , versionStringOrSymbol printString ]