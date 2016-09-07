assertions
assertClass: aClassSymbol selector: aMethodSymbol
	self assertClass: aClassSymbol.
	self
		assert:
			((MetacelloPlatform current globalNamed: aClassSymbol)
				includesSelector: aMethodSymbol)