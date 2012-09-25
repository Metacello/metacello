project lookup
lookupBaselineSpecForEnsure: aProjectSpec
	| registration loadedSpec |
	registration := MetacelloProjectRegistration
		registrationForProjectSpec: aProjectSpec
		ifAbsent: [ :new | new ]
		ifPresent: [ :existing :new | existing ].
	^ registration lookupSpec: aProjectSpec