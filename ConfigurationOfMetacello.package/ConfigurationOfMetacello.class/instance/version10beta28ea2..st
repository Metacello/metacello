versions
version10beta28ea2: spec
	<version: '1.0-beta.28-ea.2' imports: #('1.0-beta.28-ea-baseline' )>

	spec for: #common do: [
		spec blessing: #development.
		spec description: '- only bleedingEdge has a standard default ... most other versions like #stable and #development should have a static version specidifed instead of a dynamic version
- pragma for default version methods i.e., <defaultSymbolicVersion: #bleedingEdge>
- symbolic versions (Including default) are resolved during project construction, so all version information is in the spec
- changed labels in OB-Metacello to use ''Configuration'' instead of ''Project'', renamed classes to reflect this change
- added two new commands for OB-Metacello: ''Validate Configuration'' and ''ValidateConfiguration Version''
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '11/8/2010 11:22'.
		spec 
			project: 'Gofer Core' with: '1.0.2.1';
			project: 'Gofer Tests' with: '1.0.2.1'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.5';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.388';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.442';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.23';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.63';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.16';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.12';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.118';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.10'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #gemstone10beta24PreLoadDoIt. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.16'.].
	spec for: #squeakCommon do: [
		spec 
			project: 'OB' with: '1.1.4';
			project: 'Help System' with: '1.1'.
		spec 
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2';
			package: 'Metacello-Help' with: 'Metacello-Help-tbn.3'.].
	spec for: #pharo do: [
		spec project: 'ProfStef' with: '1.0'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.17'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.5'.].