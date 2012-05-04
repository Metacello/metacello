utility
configurationClasses
	"Return a set of the Metacello configuration classes that have been loaded into the image."
	<apiDocumentation>
	| answer |
	answer := Set new.
	Object allSubclasses
		do: [ :cl | 
			(([ cl isMetacelloConfig ] on: Error do: [ :ex | ex return: false ])
				and: [ cl name asString beginsWith: 'ConfigurationOf' ])
				ifTrue: [ answer add: cl ] ].
	^ answer