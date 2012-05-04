baselines
baseline10beta05: spec 
	<version: '1.0-beta.5-baseline' imports: #('1.0-beta.3-baseline')>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'Extensions to 1.0-beta.3-baseline: 
- Samples group includes Seaside-Metacello-Configuration and GemTools-Configuraton (Metacello-Configuration should not be included ... it is always present)'.

		spec 
			package: 'GemTools-Configuraton' with: [
				spec repository: 'http://seaside.gemstone.com/ss/GLASSClient' ];
			removePackage: 'ConfigurationOfMetacello'.
		spec
			group: 'Samples' overrides: 
				#('Seaside-Metacello-Configuration' 'GemTools-Configuraton' ) ].
