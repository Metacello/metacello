versions-31
version310comet: spec
	<version: '3.1.0-comet' imports: #('3.1.0-comet-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'Comet-Core' with: 'Comet-Core-pmm.54';
			package: 'Comet-Examples' with: 'Comet-Examples-lr.25';
			package: 'Comet-Tests-Core' with: 'Comet-Tests-Core-lr.11' ].
		
	spec for: #'pharo' do: [
		spec package: 'Comet-Pharo-Core' with: 'Comet-Pharo-Core-lr.6' ]