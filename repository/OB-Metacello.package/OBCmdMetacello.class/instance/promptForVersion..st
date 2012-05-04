private
promptForVersion: message

	| loadedVersion version |
	loadedVersion := self currentVersion.
	version := self 
		chooseVersion: [:vrsn |
			"show current version and all versions later than current version"
			loadedVersion == nil
				or: [ vrsn >= loadedVersion ]] 
		message: message.
	version == #all 
		ifTrue: [ version := self chooseVersion: [:vrsn | true ] message: message ].
	^version
