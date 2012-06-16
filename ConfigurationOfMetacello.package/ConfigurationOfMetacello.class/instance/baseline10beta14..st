baselines
baseline10beta14: spec 
	<version: '1.0-beta.14-baseline' imports: #('1.0-beta.13-baseline')>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'switch gofer repositories'.

		spec 
			package: 'Gofer' with: [
				spec repository: 'http://source.lukas-renggli.ch/gofer' ];
			yourself].
