execution
execute
	| message |
	message := OBMultiLineTextRequest prompt: 'Enter commit message.'.
	message == nil
		ifTrue: [ ^ OBInformRequest message: 'Commit aborted.' ].
	MetacelloPlatform current transact: [ self executeSaveProject: message ]