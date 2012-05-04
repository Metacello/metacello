utility
configurationNameFrom: baseName
	"Return the fully-qualified configuration class name."

	<apiDocumentation>
	^ (baseName indexOfSubCollection: 'ConfigurationOf') > 0
		ifTrue: [ baseName ]
		ifFalse: [ 'ConfigurationOf' , baseName ]