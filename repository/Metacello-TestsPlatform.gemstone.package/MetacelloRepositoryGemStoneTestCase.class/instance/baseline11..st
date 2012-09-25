baselines
baseline11: spec 
	<version: '1.1-baseline'>
	
	spec for: #gemstone do: [
		spec 
			package: 'Example-Core' with: [ 
				spec 
					includes: 'Example-AddOn';
					file: 'Example-Core-anon.1';
					repository: 'client:///opt/mcexamples' ]].
