versions
version10beta272: spec
	<version: '1.0-beta.27.2' imports: #('1.0-beta.27-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- OBCmdMetacello >> isActive used #and:and which is deprecated in Pharo 1.1rc4'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '7/5/2010 09:31'.
		spec 
			project: 'Gofer Core' with: '1.0.2.1';
			project: 'Gofer Tests' with: '1.0.2.1'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.363';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.417';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.20';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.57';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.16';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.8';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.106';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.7'.].
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
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.16'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.5'.].