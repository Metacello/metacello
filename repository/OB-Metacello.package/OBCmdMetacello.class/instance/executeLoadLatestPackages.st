execution
executeLoadLatestPackages

	| version |
	(version := self promptForBaselineVersion: 'Which version would you like to load from?') ~~ nil
		ifTrue: [ 
			version load: version defaultPackageNamesToLoad.
			OBInformRequest message: version versionString, ' loaded.']