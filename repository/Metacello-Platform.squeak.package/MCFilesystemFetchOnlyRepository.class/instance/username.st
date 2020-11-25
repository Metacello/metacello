accessing
username

	^ username isEmptyOrNil
		ifFalse: [username]
		ifTrue: [self class siteUsername]