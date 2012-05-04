execution
executeLoadProject

	| version |
	(version := self promptForVersion: 'Which version would you like loaded?') ~~ nil
		ifTrue: [ 
			version load: version defaultPackageNamesToLoad.
			OBInformRequest message: version versionString, ' loaded.']