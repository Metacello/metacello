api
for: attribute version: aString
	"conditional symbolicVersion support"

	self attributeMap at: attribute put: aString.
	self addAttribute: attribute
