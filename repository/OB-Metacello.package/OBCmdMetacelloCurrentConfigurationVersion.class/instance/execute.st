execution
execute

	| version |
	(version := self selectedProjectInstance currentVersion) ~~ nil
		ifTrue: [ OBInformRequest message: version printString ] 
		ifFalse: [ OBInformRequest message: 'The current version for ', self selectedProjectInstance label, ' is unknown.']