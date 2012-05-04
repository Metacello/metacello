execution
execute
	| issues |
	issues := MetacelloToolBox validateConfiguration: self selectedClass debug: self debugList recurse: true.
	issues isEmpty
		ifTrue: [ ^OBInformRequest message: 'No issues' ].
	issues := issues select: [ :issue | issue isCritical ].
	issues isEmpty
		ifTrue: [ OBInformRequest message: 'No critical issues' ]
		ifFalse: [ issues inspect ]