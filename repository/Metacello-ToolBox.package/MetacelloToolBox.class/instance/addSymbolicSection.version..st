api-configuration
addSymbolicSection: attribute version: versionString
	self methodSpec methodSections
		do: [ :methodSection | 
			methodSection attribute == attribute
				ifTrue: [ 
					methodSection versionString: versionString.
					^ self ] ].
	self methodSpec addMethodSection: attribute versionString: versionString