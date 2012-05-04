baselines
baseline10beta11: spec 
	<version: '1.0-beta.11-baseline' imports: #('1.0-beta.3-baseline')>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'Removing Samples completely... Confusing I think'.

		spec 
			removePackage: 'Seaside-Metacello-Configuration';
			removePackage: 'GemTools-Configuraton';
			removePackage: 'ConfigurationOfMetacello'.
		spec
			removeGroup: 'Samples'].
