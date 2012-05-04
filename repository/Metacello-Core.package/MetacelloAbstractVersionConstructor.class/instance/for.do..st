api
for: attribute do: aBlock
	"conditional version support"

	| blockList |
	blockList := self attributeMap
		at: attribute
		ifAbsent: [ self attributeMap at: attribute put: (blockList := OrderedCollection new) ].
	blockList add: aBlock.
	self addAttribute: attribute