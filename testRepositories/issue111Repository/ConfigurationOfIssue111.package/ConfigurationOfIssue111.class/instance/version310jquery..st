versions-31
version310jquery: spec
	<version: '3.1.0-jquery' imports: #('3.1.0-jquery-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'JQuery-Core' with: 'JQuery-Core-pmm.125';
			package: 'JQuery-JSON' with: 'JQuery-JSON-pmm.1';
			package: 'JQuery-Tests-Core' with: 'JQuery-Tests-Core-pmm.135';
			package: 'JQuery-Tests-JSON' with: 'JQuery-Tests-JSON-pmm.1' ]
