private
commitPackages: packages in: loaderDirective message: initialMessage

	| packageNames message projectPackage |
	packageNames := ''.
	packages do: [:directive | packageNames := packageNames, '  - ', directive spec label, String cr ].
	packageNames notEmpty
		ifTrue: [ 
			(OBConfirmationRequest 
				prompt: 'Packages in ', loaderDirective label, ' have been modified. Would you like to commit the packages?' 
				confirm: 'Commit packages' 
				cancel: 'Skip') ~~ true
					ifTrue: [ ^initialMessage ].
			message := initialMessage, String cr, packageNames.
			message := OBMultiLineTextRequest 
				prompt: 'Enter commit message for packages in: ', loaderDirective label printString
				template: message.
			message == nil ifTrue: [ ^nil ].
			MetacelloPlatform current
				collection: packages 
				do: [:directive | 
					self commitDirective: directive message: message ]
				displaying: 'Committing packages in ', loaderDirective label.	
			(OBConfirmationRequest 
				prompt: 'Packages in ', loaderDirective label printString, ' saved. Would you like to update the configuration?' 
				confirm: 'Update configuration' 
				cancel: 'Skip') == true
					ifTrue: [ self executeUpdatePackageMethods: loaderDirective message: message ].
			^message ].
	^self commitConfigurationFor: loaderDirective message: initialMessage