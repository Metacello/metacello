versions-31
version310json: spec
	<version: '3.1.0-json' imports: #('3.1.0-json-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'Seaside-JSON-Core' with: 'Seaside-JSON-Core-pmm.15';
			package: 'Seaside-Tests-JSON' with: 'Seaside-Tests-JSON-pmm.7' ].
		
	spec for: #'squeakCommon' do: [
		spec 
			package: 'Seaside-Pharo-JSON-Core' with: 'Seaside-Pharo-JSON-Core-pmm.1' ]