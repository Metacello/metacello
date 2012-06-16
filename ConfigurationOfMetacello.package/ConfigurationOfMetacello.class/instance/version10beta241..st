versions
version10beta241: spec
	<version: '1.0-beta.24.1' imports: #('1.0-beta.22-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- fix Issue 66: http://code.google.com/p/metacello/issues/detail?id=66 "loading latest broken by new code in 1.0-beta.24"'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '3/17/2010 11:26'.
		spec 
			project: 'Gofer Core' with: '1.0.1';
			project: 'Gofer Tests' with: '1.0.1'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-Dalehenrichs.349';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.Issue66.335';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.28';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-tbn.19';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.40';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.13';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.8';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.66';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.5'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #gemstone10beta24PreLoadDoIt. ];
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.15'.].
	spec for: #squeakCommon do: [
		spec project: 'OB' with: '1.1'.
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec project: 'ProfStef' with: '1.0'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.13'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.5'.].