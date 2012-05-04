api
for: attribute version: aString
	"conditional symbolicVersion support"

	self methodSections
		add:
			((MetacelloSymbolicVersionSpec new)
				attribute: attribute;
				versionString: aString;
				yourself)