versions
version10beta263: spec
	<version: '1.0-beta.26.3' imports: #('1.0-beta.25-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- fix Issue 81: http://code.google.com/p/metacello/issues/detail?id=81 "wrong mcz file can be loaded when mcz file has Monticello dependencies"
- fix Issue 82: http://code.google.com/p/metacello/issues/detail?id=82 "Metacello and (Windows) file repositories"
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '6/11/2010 11:26'.
		spec 
			project: 'Gofer Core' with: '1.0.2';
			project: 'Gofer Tests' with: '1.0.2'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-tbn.362';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.409';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.30';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.20';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.56';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.15';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.8';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.102';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.7'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #gemstone10beta24PreLoadDoIt. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.16'.].
	spec for: #squeakCommon do: [
		spec project: 'OB' with: '1.1.1'.
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec project: 'ProfStef' with: '1.0'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.16'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.5'.].