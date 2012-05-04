execution
execute
	
	MetacelloPlatform current transact: [ | message |
		message := self selectedProjectInstance updateProject
			ifTrue: [ self selectedProjectInstance label, ' project updated. Would you like to load a version of the project?' ]
			ifFalse: [self selectedProjectInstance label, ' already up-to-date. Would you like to load a version of the project?' ].
		(OBConfirmationRequest prompt: message confirm: 'Load project version' cancel: 'Cancel') == true
			ifTrue: [ self executeLoadProject ]]