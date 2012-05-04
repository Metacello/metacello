private
executeUpdatePackageMethods: loaderDirective message: initialMessage

	| versionSpec config versionString |
	versionSpec := loaderDirective spec.
	config := versionSpec project configuration.
	versionString := versionSpec versionString.
	(MetacelloVersionConstructor 
		updatePackageMethodIn: config class new
		sourceVersion: versionString)
		ifTrue: [ 
			(OBConfirmationRequest prompt: 'Package methods updated for ', loaderDirective label, '. Would you like to save the updated configuration?' confirm: 'Save configuration' cancel: 'Cancel') == true
				ifTrue: [ | message projectPackage repositoryList |
					message := loaderDirective spec versionString, ':', String cr, String cr, initialMessage.
					message := OBMultiLineTextRequest 
						prompt: 'Enter commit message for configuration: ', loaderDirective label printString
						template: message.
					message == nil ifTrue: [ ^initialMessage ].
					projectPackage := config project projectPackage.
					repositoryList := loaderDirective loader repositoriesFrom: projectPackage repositorySpecs ignoreOverrides: true.
					self commitPackageSpec: projectPackage into: repositoryList with: message].
			^self].
	self commitConfigurationFor: loaderDirective message: initialMessage