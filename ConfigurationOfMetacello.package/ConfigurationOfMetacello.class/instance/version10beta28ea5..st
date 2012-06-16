versions
version10beta28ea5: spec
	<version: '1.0-beta.28-ea.5' imports: #('1.0-beta.28-ea.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '- transferred tutorial lessons to ProfStef
- convert OB-Metacello to use MetacelloToolbox API
- validate configuration before saving
- portable copyClass for toolbox
- use #notDefined when a symbolicVersion is not defined ... that way you can define a symbolic version for #common and "undefine" the symbolic version for #pharo
- allow a symbolicVersion to reference another symbolic version ... do loop detection etc...improved
- add auto-generated Metacello method and class based Help Browser entries
- add ability to exclude validation issues (moral equivalent of expected failure in SUnit)
- fine tune recommended development process
- update comments for api documentation
- help browser documentation loaded as part of default group (for Pharo....for now)'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '12/1/2010 12:35'.
		spec 
			project: 'Gofer Core' with: '1.0.3';
			project: 'Gofer Tests' with: '1.0.3'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.7';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.429';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.480';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.24';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.78';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.16';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.118';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.16';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-DaleHenrichs.59'.].

	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.18'.].

	spec for: #'squeakCommon' do: [
		spec 
			project: 'OB' with: '1.2.1';
			project: 'Help System' with: '1.1'.
		spec 
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2';
			package: 'Metacello-Help' with: 'Metacello-Help-DaleHenrichs.4'.].

	spec for: #'pharo' do: [
		spec project: 'ProfStef' with: '1.5'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.7';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.22'.].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.7'.].
