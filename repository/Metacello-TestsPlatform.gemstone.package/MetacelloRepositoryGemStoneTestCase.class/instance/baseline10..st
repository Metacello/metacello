baselines
baseline10: spec 
	<version: '1.0-baseline'>
	
	spec for: #gemstone do: [
		spec 
			package: 'Example-Core' with: [ 
				spec 
					includes: 'Example-AddOn';
					file: 'Example-Core-anon.1';
					repository: '/home/dhenrich/monticello' ]].
