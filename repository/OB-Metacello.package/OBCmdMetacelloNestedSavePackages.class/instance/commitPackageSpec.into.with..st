private
commitPackageSpec: packageSpec into: repositoryList with: message

	repositoryList size > 1 
		ifTrue: [
			(OBConfirmationRequest 
				prompt: 'The package: ', packageSpec name, ' will be committed to more than one repository. Is that all right?'
				confirm: 'Commit to mulitple repository' 
				cancel: 'Skip') ~~ true ifTrue: [ ^self ]].
	super commitPackageSpec: packageSpec into: repositoryList with: message