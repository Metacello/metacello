versions
version10beta28ea1: spec
	<version: '1.0-beta.28-ea.1' imports: #('1.0-beta.28-ea-baseline' )>

	spec for: #common do: [
		spec blessing: #development.
		spec description: '- clean up undefined symbols refs in Metacello-Base
- adjust validation to provide warning when no version is specified 
- differentiate between versions not specified, but resolved and versions not resolved in validation
- validation for duplicate attribute blocks
- fix Issue 100: http://code.google.com/p/metacello/issues/detail?id=100 "last block wins when there are duplicate attribute blocks"
- add symbolic versions to version chooser in OB-Metacello
- recursive validation option
- extended validation to restrict recursive validation of a particular version 
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '11/5/2010 11:13'.
		spec 
			project: 'Gofer Core' with: '1.0.2.1';
			project: 'Gofer Tests' with: '1.0.2.1'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.4';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.385';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.439';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.23';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.62';
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