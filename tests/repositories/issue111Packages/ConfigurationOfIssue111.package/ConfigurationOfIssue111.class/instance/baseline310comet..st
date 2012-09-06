baselines-31
baseline310comet: spec
	<version: '3.1.0-comet-baseline' imports: #('3.1.0-jquery-baseline')>

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'Comet-Core' with: [
				spec requires: #('Javascript-Core' 'Seaside-Canvas' ) ];
			package: 'Comet-Tests-Core' with: [
				spec requires: #('Javascript-Tests-Core' 'Comet-Core' ) ];
			package: 'Comet-Examples' with: [
				spec requires: #('JQuery-Core' 'Comet-Core'). ].
		spec 
			group: 'Comet' with: #('Comet-Core');
			group: 'Comet Tests' with: #('Comet-Tests-Core' );
			group: 'Comet Examples' with: #('Comet-Examples' ) ].
		
	spec for: #'pharo' do: [
		spec 
			package: 'Comet-Core' with: [
				spec includes: #('Comet-Pharo-Core' ) ];
			package: 'Comet-Pharo-Core' with: [
				spec requires: #('Comet-Core' ) ] ]