baselines
baseline10beta19: spec 
	<version: '1.0-beta.19-baseline' imports: #('1.0-beta.18-baseline')>

	spec for: #'Gofer-Core' do: [
		spec
			removePackage: 'Gofer';
			package: 'Gofer-Core'  with: [
				spec repository: 'http://www.squeaksource.com/Pharo' ];
			package: 'Gofer-Tests'  with: [
				spec repository: 'http://www.squeaksource.com/Pharo' ];
			package: 'Metacello-MC' overrides: [
				spec requires: #('Gofer-Core') ];
			package: 'Metacello-TestsMC' with: [
				spec requires: #('Gofer-Tests') ];
			yourself ].
