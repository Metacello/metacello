versions
version10beta17: spec
	<version: '1.0-beta.17' imports: #('1.0-beta.17-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- fix a branch name problem for working copies
- fine tune the ''Update Package Methods'' algorithm
- fix Issue 3: http://code.google.com/p/metacello/issues/detail?id=3 ''Save Packages'' save new
- fix Issue 12: http://code.google.com/p/metacello/issues/detail?id=12 Wait cursor during load
- fix Issue 14: http://code.google.com/p/metacello/issues/detail?id=14 Ftp repository for Pharo & Squeak
- fix Issue 19: http://code.google.com/p/metacello/issues/detail?id=19 Bug in Spawn New Version
'.
		spec author: 'dkh'.
		spec timestamp: '12/9/2009 11:13'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.83';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.306';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.268';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.19';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.38';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.5';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.2';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.12';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.9'.].
	spec for: #squeakCommon do: [
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.9'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].