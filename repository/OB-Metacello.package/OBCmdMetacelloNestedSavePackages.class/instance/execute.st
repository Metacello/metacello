execution
execute

	| map |
	MetacelloPlatform current transact: [ | version |
		(version := self promptForVersion: 'Saving packages for which version?') ~~ nil
			ifTrue: [
				MetacelloPlatform current 
					do: [ map := self packagesNeedSaving: version ] 
					displaying: 'Analyzing packages ', version versionNumber printString, ' of ', version spec label.
				map notEmpty
					ifTrue: [ | message skipped |
						message := '- commit message for:'.
						skipped := IdentitySet new.
						map associations do: [:assoc |  | newMessage directive configClass |
							directive := assoc key.
							configClass := directive spec project configuration class.
							(skipped includes: configClass)
								ifFalse: [ 
									(newMessage := self commitPackages: assoc value in: directive message: message) == nil
										ifTrue: [ skipped add:  configClass ]
										ifFalse: [ message := newMessage ]]].
						self saveConfigsFor: version message: message.
						^OBInformRequest message: 'Done.'].
				(self saveConfigsFor: version message: '- commit message for:') == nil 
					ifTrue: [ OBInformRequest message: 'No packages for ', version versionString, ' saved.' ]
					ifFalse: [ OBInformRequest message: 'Done.' ]]]