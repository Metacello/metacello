execution
execute
	MetacelloPlatform current
		transact: [ 
			| sourceVersion selector targetVersionString vn |
			(sourceVersion := self chooseVersion: [ :vrsn | true ] message: 'Select the version to be used as the source?')
				~~ nil
				ifTrue: [ 
					vn := sourceVersion versionString asMetacelloVersionNumber copy incrementMinorVersionNumber.
					targetVersionString := OBTextRequest
						prompt: 'Enter the target version number (source: ' , sourceVersion versionString , ').'
						template: vn printString.
					MetacelloToolBox
						createVersion: targetVersionString
						for: self selectedClass name asString
						from: sourceVersion versionString
						description: '' ] ]