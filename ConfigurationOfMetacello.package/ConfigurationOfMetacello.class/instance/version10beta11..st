versions
version10beta11: spec
	<version: '1.0-beta.11' imports: #('1.0-beta.11-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'beta'.
		spec description: '- pick up latest Gofer package
- fix a project version loading bug
- printing fix
- fix an update packages bug
- adjust working version package name calculation
- fix current version package name calculation (http://code.google.com/p/metacello/issues/detail?id=4)
- doits bugfix
- fix a project reference project package bug
- add ''Load Latest Packages'' OB command
- remove Samples group
- save packages fix
- must be able to load packages that use directory repositories
- GemStone/GLASS support'.
		spec author: 'dkh'.
		spec timestamp: '10/31/09 11:03:31'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.76';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.294';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.239';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.18';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.32';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.4';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.1';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.11';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #'gemstone' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.7'.].
	spec for: #'pharo' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].