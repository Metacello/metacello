versions
version10beta22: spec
	<version: '1.0-beta.22' imports: #('1.0-beta.22-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- fix Issue 36: http://code.google.com/p/metacello/issues/detail?id=36 "Use ConfigurationOfOB for Metacello"
- fix Issue 49: http://code.google.com/p/metacello/issues/detail?id=49 "occassional load of older versions of projects"
- fix Issue 52: http://code.google.com/p/metacello/issues/detail?id=52 "preload/postload for groups and projects"
- MetacelloMCVersion>>resolveToLoadableSpecs: added to supplement query API
- support for Metaceller
- fix a bug in MetacelloMCProjectSpec>>resolveToAllPackagesIn:visited: when the project spec doesn''t have a versionString specified
- ProfStef tutorial (MetacelloCreateConfigurationTutorial)
- latest Gofer (Gofer-Core-lr.116 and Gofer-Tests-lr.115)
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '1/25/2010 14:19'.
		spec 
			project: 'Gofer Core' with: '1.0';
			project: 'Gofer Tests' with: '1.0'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.328';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.312';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.28';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-tbn.19';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.40';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.13';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.3';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.43';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.5'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.236'.
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.13'.].
	spec for: #squeakCommon do: [
		spec project: 'OB' with: '1.1'.
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec project: 'ProfStef' with: '1.0'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.12'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.4'.].