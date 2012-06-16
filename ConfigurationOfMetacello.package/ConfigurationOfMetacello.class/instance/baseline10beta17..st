baselines
baseline10beta17: spec 
	<version: '1.0-beta.17-baseline' imports: #('1.0-beta.16-baseline')>
	
	spec for: #squeakCommon do: [
		spec 
			package: 'Metacello-TestsPlatform' with: [
				spec
					requires: #('Metacello-Platform');
					file: 'Metacello-TestsPlatform.squeakCommon'];
			yourself.
		spec
			group: 'Tests' with: #('Metacello-TestsPlatform')].
		
