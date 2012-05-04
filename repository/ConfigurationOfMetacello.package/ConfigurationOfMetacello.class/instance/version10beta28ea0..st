versions
version10beta28ea0: spec
	<version: '1.0-beta.28-ea.0' imports: #('1.0-beta.28-ea-baseline' )>

	spec for: #common do: [
		spec blessing: #development.
		spec description: '- snap off an early access version so folks can play with symbolic versions, etc. while I continue development
- pick up #versionKey from work done with Simon during ESUG 2010
- add MetacelloPlatform>>primeStackCacheWith:doing: from work done with Simon during ESUG 2010
- deprecate MetacelloPlatform>>primeStackCacheFor:doing:defaultDictionary:
- add primeStackCache tests
- dynamic caching for 5x speedup of #currentVersion
- standard Pharo version attributes: #''pharo1.x'', #''pharo1.0.x'', #''pharo1.1.x'', #''pharo1.2.x''
- throw an error when a version is not found
- collapse running zeroes in a version number in absence of a numeric element
- integrated changes from 1.0-beta.27.5
- introduce MetacelloBaseConfiguration added so that Configurations can have a superclass (or not)
- introduce symbolic versions. 
  - #development, #stable, and #bleedingEdge are standard versions.
  - a default is defined for each of them in the abstract configuration
- if versionString not defined for project reference, #bleedingEdge version is used as the default (instead of latest version)
- stop using #lastMetacelloVersionLoad altogether
- add Configuration validation 
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '11/4/2010 12:35'.
		spec 
			project: 'Gofer Core' with: '1.0.2.1';
			project: 'Gofer Tests' with: '1.0.2.1'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.3';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.379';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.438';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.23';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.60';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.16';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.12';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.116';
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