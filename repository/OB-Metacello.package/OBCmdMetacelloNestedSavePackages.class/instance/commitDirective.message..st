private
commitDirective: directive message: message

	| repo repos |
	(repo := directive repository) == nil 
		ifTrue: [ repos := directive loader repositoryMap at: directive externalReference packageName ]
		ifFalse: [ repos := Array with: repo ].
	self commitPackageSpec: directive spec into: repos with: message