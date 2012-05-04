baselines
baseline10beta03: spec 
	<version: '1.0-beta.3-baseline' imports: #('1.0-beta.0-baseline')>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'Extensions to 1.0-beta.0-baseline: 
- ''default'' group is just the core ... class-side loaders load ''ALL'' by default
- pull in some old tests that still apply
- combine Metacello-ConfigTests into Metacello-TestsMC
- rename Metacello-ReferenceTests to Metacello-TestsReference
- recast tutorial to new API
- add Samples group (Metacello-Configuration [duh] and Seaside-Metacello-Configuration'.

		spec 
			package: 'Metacello-Tutorial' with: [
				spec requires:  #('Metacello-Core'). ];
			package: 'Metacello-TestsCore' with: [
				spec requires:  #('Metacello-Core'). ];
			package: 'Metacello-TestsMC' with: [
				spec requires:  #('Metacello-Core'). ];
			package: 'Metacello-TestsReference' with: [
				spec requires: #('Metacello-Reference') ];
			package: 'Metacello-TestsTutorial' with: [
				spec requires:  #('Metacello-Tutorial'). ];
			removePackage: 'Metacello-ConfigTests';
			removePackage: 'Metacello-ReferenceTests';
			"SAMPLE"
			package: 'ConfigurationOfMetacello' with: [
				spec repository: 'http://seaside.gemstone.com/ss/metacello' ];
			"SAMPLE"
			package: 'Seaside-Metacello-Configuration' with: [
				spec repository: 'http://seaside.gemstone.com/ss/Seaside30' ].
		spec
			group: 'default' overrides: #('Metacello-Core');
			group: 'Samples' with: #('ConfigurationOfMetacello' 'Seaside-Metacello-Configuration');
			group: 'Tests' overrides: 
				#('Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC'
				  'Metacello-TestsReference'). ].
