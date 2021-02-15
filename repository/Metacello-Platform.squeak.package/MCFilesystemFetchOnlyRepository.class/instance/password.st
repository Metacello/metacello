accessing
password

	^ password isEmptyOrNil
		ifFalse: [password]
		ifTrue: [self class sitePassword]