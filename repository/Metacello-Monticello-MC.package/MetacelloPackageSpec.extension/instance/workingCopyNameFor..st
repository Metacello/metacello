*metacello-monticello-mc
workingCopyNameFor: anMCLoader

	| vi |
	(vi := anMCLoader currentVersionInfoFor: self) == nil ifTrue: [ ^nil ].
	^vi name