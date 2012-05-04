adding
addMethodSection: attribute versionString: aString
	self methodSections
		add:
			((MetacelloSymbolicVersionSpec new)
				attribute: attribute;
				versionString: aString;
				yourself)