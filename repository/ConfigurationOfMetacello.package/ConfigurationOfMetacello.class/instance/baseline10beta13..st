baselines
baseline10beta13: spec 
	<version: '1.0-beta.13-baseline' imports: #('1.0-beta.11-baseline')>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'fix Metacello-MC dependency'.

		spec 
			package: 'OB-Metacello' with: [
				spec requires: #('Metacello-Platform' 'Metacello-Core') ];
			yourself].
