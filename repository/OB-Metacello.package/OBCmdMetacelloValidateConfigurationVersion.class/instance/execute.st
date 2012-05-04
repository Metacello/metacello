execution
execute
	| issues version |
	version := self chooseVersion: [ :vrsn | true ] message: 'Select version to validate' includeSymbolicVersions: false.
	issues := MetacelloToolBox
		validateProject: self selectedProjectInstance
		version: version versionString
		debug: #()
		recurse: true.
	issues isEmpty
		ifTrue: [ ^OBInformRequest message: 'No issues' ].
	true
		ifTrue: [ issues := issues select: [ :issue | issue isCritical ] ].
	issues isEmpty
		ifTrue: [ OBInformRequest message: 'No critical issues' ]
		ifFalse: [ issues inspect ]