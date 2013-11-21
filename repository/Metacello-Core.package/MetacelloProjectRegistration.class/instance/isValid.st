testing
isValid
	^ self isProjectNameValid and: [ self eitherConfigurationOrBaselineIsSet ]