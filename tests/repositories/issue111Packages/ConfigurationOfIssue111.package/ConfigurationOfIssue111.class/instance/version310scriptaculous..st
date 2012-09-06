versions-31
version310scriptaculous: spec
	<version: '3.1.0-scriptaculous' imports: #('3.1.0-scriptaculous-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'Prototype-Core' with: 'Prototype-Core-pmm.27';
			package: 'Prototype-Tests-Core' with: 'Prototype-Tests-Core-pmm.16';
			package: 'Scriptaculous-Core' with: 'Scriptaculous-Core-pmm.103';
			package: 'Scriptaculous-Tests-Core' with: 'Scriptaculous-Tests-Core-pmm.62';
			package: 'Scriptaculous-Components' with: 'Scriptaculous-Components-pmm.112';
			package: 'Scriptaculous-Tests-Components' with: 'Scriptaculous-Tests-Components-pmm.40' ]
