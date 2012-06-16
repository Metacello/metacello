baselines
baseline10beta16: spec 
	<version: '1.0-beta.16-baseline' imports: #('1.0-beta.14-baseline')>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'switch gofer repositories again ... use copy in Metacello going forward'.

		spec 
			package: 'Gofer' with: [
				spec repository: 'http://seaside.gemstone.com/ss/metacello' ];
			yourself].
