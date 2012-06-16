versions
version10beta284: spec
	<version: '1.0-beta.28.4' imports: #('1.0-beta.28-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '- open 1.0-beta.28.4 for development
- improve MetacelloToolBox class>>stripVersionStringForSelector: algorithm
- fix Issue 108:	Need to update Metacello (tests and Gofer config) to integrate changes from Pharo Issue 3660
  http://code.google.com/p/metacello/issues/detail?id=108
- add MetacelloToolBox class>>stableVersion:for:platformAttribute: for MetacelloBrowser
- warn about newer versions when saving modified packages
- check for possibly newer versions when saving configuration
- testing (so there''s a halt in here too)

- warning is better than a halt ... any day
pick up patch for Pharo  Issue 3763: assert failure during Decompiler>>popIntoTemporaryVariable:
  http://code.google.com/p/pharo/issues/detail?id=3763

- integrate the parallel currentVersion calculation ... no ill affectcts yet
- another sent but not implemented cleanup for GemStone
- fix a problem with a "naked" project: call in a version method ... run into this error during automated generation
- proposed fix for Issue 122: misleading error message regarding stable versions
  http://code.google.com/p/metacello/issues/detail?id=122
- parrallel current version calculations...(actually found real-life case where parallel is better)'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '3/18/2011 15:47'.
		spec 
			project: 'Gofer Core' with: '1.0.2.2';
			project: 'Gofer Tests' with: '1.0.2.2'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.463';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.509';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.24';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.81';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.142';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.30';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.94'. ].

	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.20'. ].

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
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.25'. ].

	spec for: #'pharo1.2.x' do: [
		spec 
			project: 'OB' with: '1.2.3';
			project: 'ProfStef' with: '1.6'. ].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10'. ].
