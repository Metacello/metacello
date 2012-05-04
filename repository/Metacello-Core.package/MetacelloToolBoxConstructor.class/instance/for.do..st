api
for: attribute do: aBlock
	"conditional version support"

	| methodSection |
	methodSection := (MetacelloVersionMethodSection new)
				attribute: attribute;
				block: aBlock;
				yourself.
	currentSection ~~ nil
		ifTrue: [ currentSection addMethodSection: methodSection ]
		ifFalse: [ self methodSections add: methodSection]
