baselines
baseline10beta21: spec 
	<version: '1.0-beta.21-baseline' imports: #('1.0-beta.19-baseline')>

	spec for: #'Gofer-Core' do: [
		spec
			removePackage: 'Gofer';
			package: 'Gofer-Core'  overrides: [
				spec repository: 'http://seaside.gemstone.com/ss/metacello' ];
			package: 'Gofer-Tests'  overrides: [
				spec 
					requires: 'Gofer-Core' ;
					repository: 'http://seaside.gemstone.com/ss/metacello' ];
			yourself ].
