execution
saveConfigsFor: version message: initialMessage

	| map message |
	MetacelloPlatform current 
		do: [ map := self configsNeedSaving: version ] 
		displaying: 'Analyzing configs ', version versionNumber printString, ' of ', version spec label.
	map isEmpty ifTrue: [ ^nil ].
	message := initialMessage.
	map associations do: [:assoc | message := self commitConfigurationFor: assoc key message: message ]