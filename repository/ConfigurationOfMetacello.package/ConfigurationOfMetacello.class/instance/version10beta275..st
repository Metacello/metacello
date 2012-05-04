versions
version10beta275: spec
	<version: '1.0-beta.27.5' imports: #('1.0-beta.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '- fixes needed for new bootstrapping scheme in GemStone3.0
- stop using deprecated in Pharo1.2 methods (sortBy:)
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '11/11/2010 11:29'.
		spec 
			project: 'Gofer Core' with: '1.0.2.1';
			project: 'Gofer Tests' with: '1.0.2.1'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.390';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.445';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.21';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.60';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.16';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.13';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.114';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.9'.].
	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.239'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.16'.].
	spec for: #'squeakCommon' do: [
		spec 
			project: 'OB' with: '1.1.4';
			project: 'Help System' with: '1.1'.
		spec 
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2';
			package: 'Metacello-Help' with: 'Metacello-Help-tbn.3'.].
	spec for: #'pharo' do: [
		spec project: 'ProfStef' with: '1.0'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.16'.].
	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.5'.].