baselines
baseline10beta18: spec 
	<version: '1.0-beta.18-baseline' imports: #('1.0-beta.17-baseline')>
	
	spec for: #gemstone do: [
		spec
			project: 'Monticello' with: [
				spec
					className: 'ConfigurationOfGsMonticello';
					file: 'ConfigurationOfGsMonticello';
					repository: 'http://seaside.gemstone.com/ss/monticello' ];
			yourself.
		spec 
			package: 'Gofer' with: [
				spec requires: #('Monticello')];
			yourself. ].
		
