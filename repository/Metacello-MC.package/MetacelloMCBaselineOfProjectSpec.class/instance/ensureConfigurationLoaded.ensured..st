loading
ensureConfigurationLoaded: vrsn ensured: ensured
	(vrsn blessing == #development
		or: [ 
			(MetacelloLookupBaselineSpecForEnsureLoad new
				projectSpec: self;
				yourself) signal ])
		ifTrue: [ ^ ensured ~~ #latest ].
	^ false