external repository
setUpBaselineOfExternal
	"self reset"

	| reference className definitionArray versionInfo |
	reference := GoferVersionReference name: 'BaselineOfExternalX-dkh.1'.
	className := #BaselineOfExternalX.
	definitionArray := {(MCClassDefinition
		name: className
		superclassName: #Object
		category: reference packageName
		instVarNames: #()
		comment: '').
	(MCMethodDefinition
		className: className asString
		classIsMeta: false
		selector: 'externalBaseline:'
		category: 'cat'
		timeStamp: ''
		source: (self class sourceCodeAt: #externalBaseline:) asString)}.
	externalRepository
		basicStoreVersion:
			(MCVersion new
				setPackage: (MetacelloTestsMCPackage new name: reference packageName)
				info:
					(versionInfo := MCVersionInfo
						name: reference name
						id: UUID new
						message: 'This is a mock version'
						date: Date today
						time: Time now
						author: reference author
						ancestors: #())
				snapshot: (MCSnapshot fromDefinitions: definitionArray)
				dependencies: #()).
	^ versionInfo