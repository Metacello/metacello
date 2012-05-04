execution
execute
	MetacelloPlatform current
		transact: [ 
			| version |
			(version := self promptForDevelopmentVersion: 'Saving packages for which version?') ~~ nil
				ifTrue: [ 
					| message saved |
					message := OBMultiLineTextRequest prompt: 'Enter commit message.'.
					message == nil
						ifTrue: [ ^ OBInformRequest message: 'Commit aborted.' ].
					saved := (MetacelloToolBox
						saveModifiedDevelopmentPackages: version versionString
						for: self selectedClass name asString
						description: message) notEmpty
						ifTrue: [ 
							(OBConfirmationRequest
								prompt: 'Packages for ' , version versionString , ' saved. Would you like to update the package methods?'
								confirm: 'Update package methods'
								cancel: 'Cancel') == true
								ifTrue: [self executeUpdatePackageMethods: version description: message ] ]
						ifFalse: [ OBInformRequest message: 'No packages for ' , version versionString , ' saved.' ] ] ]