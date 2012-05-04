private
promptForDevelopmentVersion: message
	| versions labels project |
	versions := (self reversedVersions select: [ :vrsn | vrsn blessing == #development ]) asOrderedCollection.
	labels := (versions collect: [ :vrsn | vrsn versionString ]) asOrderedCollection.
	(project := self selectedProjectInstance) symbolicVersionSymbols
		do: [ :each | 
			each == #development
				ifTrue: [ 
					versions addFirst: (project version: each).
					labels addFirst: each printString , ' -> ' , (project symbolicVersionMap at: each) ] ].
	versions isEmpty
		ifTrue: [ 
			self inform: 'No development versions available'.
			^ nil ].
	^ OBChoiceRequest prompt: message labels: labels values: versions