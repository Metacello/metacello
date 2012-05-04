private
commitConfigurationFor: loaderDirective message: initialMessage
	"Commit the config if it has been modified"

	| projectPackage message |
	loaderDirective spec == nil ifTrue: [ ^nil ].
	projectPackage := loaderDirective spec project projectPackage.
	(self packageNeedsSaving: projectPackage) ifFalse: [ ^nil ].
	(OBConfirmationRequest 
		prompt: 'The configuration for ', loaderDirective label printString, ' has been modified. Would you like to commit the configuration package?' 
		confirm: 'Commit configuration' 
		cancel: 'Skip') == true
			ifTrue: [
				message := loaderDirective spec versionString, ':', String cr, String cr, initialMessage.
				message := OBMultiLineTextRequest 
					prompt: 'Enter commit message for configuration: ', loaderDirective label printString
					template: message.
				message == nil ifTrue: [ ^nil ].
				projectPackage goferCommitPackage: message ].
	^message