execution
executeUpdatePackageMethods: version description: description
	(MetacelloToolBox
		updateDevelopment: version versionString
		for: self selectedClass name asString
		updateProjects: false
		description: description) notEmpty
		ifTrue: [ 
			(OBConfirmationRequest
				prompt: 'Package methods updated for ' , version versionString , '. Would you like to save the project?'
				confirm: 'Save project'
				cancel: 'Cancel') == true
				ifTrue: [ 
					| strm |
					strm := WriteStream on: String new.
					strm
						nextPutAll: version versionString , ':';
						cr;
						cr;
						nextPutAll: description.
					self executeSaveProject: strm contents ] ]
		ifFalse: [ OBInformRequest message: 'All methods for ' , version versionString , ' are up-to-date.' ]