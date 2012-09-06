baselines-31
baseline310json: spec
	<version: '3.1.0-json-baseline' imports: #('3.1.0-common-baseline')>

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'Seaside-JSON-Core' with: [
				spec requires: #('Seaside-Core' 'Seaside-Canvas' ) ];
			package: 'Seaside-Tests-JSON' with: [
				spec requires: #('Seaside-JSON-Core' ) ].
		spec 
			group: 'JSON' with: #('Seaside-JSON-Core');
			group: 'JSON Tests' with: #('Seaside-Tests-JSON' ) ].
		
	spec for: #'squeakCommon' do: [
		spec 
			package: 'Seaside-JSON-Core' with: [
				spec includes: #('Seaside-Pharo-JSON-Core' ) ].
		spec 
			package: 'Seaside-Pharo-JSON-Core' with: [
				spec requires: #('Seaside-JSON-Core') ] ]