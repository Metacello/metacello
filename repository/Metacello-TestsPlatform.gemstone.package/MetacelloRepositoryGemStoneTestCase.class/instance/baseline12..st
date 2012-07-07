baselines
baseline12: spec 
	<version: '1.2-baseline'>
	
	spec for: #gemstone do: [
		spec 
			package: 'Example-Core' with: [ 
				spec 
					includes: 'Example-AddOn';
					file: 'Example-Core-anon.1';
					repository: 'server:///opt/mcexamples' ]].
