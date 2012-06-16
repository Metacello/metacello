versions
version10beta28: spec
	<version: '1.0-beta.28' imports: #('1.0-beta.28-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '- pick up #versionKey from work done with Simon during ESUG 2010
- add MetacelloPlatform>>primeStackCacheWith:doing: from work done with Simon during ESUG 2010
- deprecate MetacelloPlatform>>primeStackCacheFor:doing:defaultDictionary:
- add primeStackCache tests
- dynamic caching for 5x speedup of #currentVersion
- standard Pharo version attributes: #''pharo1.x'', #''pharo1.0.x'', #''pharo1.1.x'', #''pharo1.2.x''
- throw an error when a version is not found
- collapse running zeroes in a version number in absence of a numeric element
- introduce MetacelloBaseConfiguration added so that Configurations can have a superclass (not yet ready for use)
- introduce symbolic versions. 
  - #development, #stable, and #bleedingEdge are standard versions.
  - a default is defined for #bleedingEdge
- fix Issue 100: http://code.google.com/p/metacello/issues/detail?id=100 "last block wins when there are duplicate attribute blocks"
- added two new commands for OB-Metacello: ''Validate Configuration'' and ''ValidateConfiguration Version''
- MetacelloToolBox added
- transferred tutorial lessons to ProfStef
- convert OB-Metacello to use MetacelloToolbox API
- update comments for api documentation
- help browser documentation loaded as part of default group (for Pharo....for now)
- speed up running of tests ... 3x faster
- postLoad and preLoad doit behavior cleaned up with regards to overriding behaviour using nil arg (i.e.,  stop preload/postload doits)
- add Squeak attributes: #''squeak3.10.x'', #''squeak4.1.x'', and #''squeak4.2.x''
- fix pharo bug 3516: http://code.google.com/p/pharo/issues/detail?id=3516 "Failing tests in MetaCello"
- OB-Metacello commands functional in Pharo1.2'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '1/17/2011 10:12'.
		spec 
			project: 'Gofer Core' with: '1.0.2.2';
			project: 'Gofer Tests' with: '1.0.2.2'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.455';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.505';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.24';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.80';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.138';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.29';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-DaleHenrichs.87'. ].

	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.19'. ].

	spec for: #'squeakCommon' do: [
		spec 
			project: 'OB' with: '1.1.4';
			project: 'Help System' with: '1.1'.
		spec 
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2';
			package: 'Metacello-Help' with: 'Metacello-Help-DaleHenrichs.9'. ].

	spec for: #'pharo' do: [
		spec project: 'ProfStef' with: '1.5'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.10';
			package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.24'. ].

	spec for: #'pharo1.2.x' do: [
		spec 
			project: 'OB' with: '1.2.3';
			project: 'ProfStef' with: '1.6'. ].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10'. ].
