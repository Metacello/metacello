versions
version10beta18: spec
	<version: '1.0-beta.18' imports: #('1.0-beta.18-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- implement MetacelloVersion>>isPossibleBaseline
- fix currentVersion when no packages or projects are in play
- fix a Spawn New Version bug
- allow for a nil #versionString spec in projects
- fix Issue 14: http://code.google.com/p/metacello/issues/detail?id=14 Ftp repository for Squeak only
- fix Issue 18: http://code.google.com/p/metacello/issues/detail?id=18 #linear default loadType
- fix Issue 21: http://code.google.com/p/metacello/issues/detail?id=21 optional blessing for Spawn New Version
- fix Issue 22: http://code.google.com/p/metacello/issues/detail?id=22 Better filter for Branch blessing and lastVersion
- fix Issue 23: http://code.google.com/p/metacello/issues/detail?id=23 Use Gofer batch commit for Save Packages
- fix Issue 26: http://code.google.com/p/metacello/issues/detail?id=26 New version of Gofer breaks Metacello
- port to latest version of Gofer (Gofer-lr.109)'.
		spec author: 'dkh'.
		spec timestamp: '12/29/2009 16:17'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.109';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.311';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.281';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.20';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.40';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.6';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.3';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.15';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.235'.
		spec 
			package: 'Gofer' with: 'Gofer-dkh.105';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.279';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.10'.].
	spec for: #squeakCommon do: [
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.9'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.4'.].