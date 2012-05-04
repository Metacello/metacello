versions
version10beta28ea3: spec
	<version: '1.0-beta.28-ea.3' imports: #('1.0-beta.28-ea.3-baseline' )>

	spec for: #common do: [
		spec blessing: #development.
		spec description: '- add MetacelloMCVersion>>difference: for getting differences between two versions ... primarily listing added/removed/modified mcz files and project version strings.
- add loop detection to validation
- stop using deprecated in Pharo1.2 methods (sortBy:)
- Metacello Tool box
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '11/12/2010 17:00'.
		spec 
			project: 'Gofer Core' with: '1.0.2.1';
			project: 'Gofer Tests' with: '1.0.2.1'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.5';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.398';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.453';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.23';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.65';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.16';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.118';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.10';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-DaleHenrichs.6'.].
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