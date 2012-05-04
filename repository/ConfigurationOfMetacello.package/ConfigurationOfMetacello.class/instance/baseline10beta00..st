baselines
baseline10beta00: spec 
	<version: '1.0-beta.0-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'Default configuration ... loads latest versions of all packages'.
		spec repository: 'http://seaside.gemstone.com/ss/metacello'.
		spec 
			package: 'Gofer' with: [
				spec repository: 'http://source.lukas-renggli.ch/flair' ];
			package: 'Metacello-Core' with: [
				spec includes: #('Metacello-MC' 'Metacello-Platform') ];
			package: 'Metacello-MC' with: [
				spec requires: #('Gofer') ];
			package: 'Metacello-Platform' with: [
				spec requires: #('Metacello-MC') ];
			package: 'Metacello-ConfigTests' with: [
				spec requires: #('Metacello-MC') ];
			package: 'Metacello-Reference' with: [
				spec requires: #('Metacello-MC') ];
			package: 'Metacello-ReferenceTests' with: [
				spec requires: #('Metacello-Reference') ];
			package: 'OB-Metacello' with: [
				spec requires: #('Metacello-Platform') ].
		spec
			group: 'default' with: #('Metacello-Core' 'Metacello-Reference');
			group: 'UI' with: #('Metacello-Core' 'OB-Metacello'); 
			group: 'Tests' with: #('Metacello-ConfigTests' 'Metacello-ReferenceTests') ].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone'].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo'].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak' ].
