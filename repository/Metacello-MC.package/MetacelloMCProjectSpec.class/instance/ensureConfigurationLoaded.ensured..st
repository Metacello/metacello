loading
ensureConfigurationLoaded: vrsn ensured: ensured
	vrsn blessing == #development
		ifTrue: [ 
			ensured ~~ #latest
				ifTrue: [ ^ MetacelloScriptEnsureProjectLoadedForDevelopment signal ] ].
	^ false