versions
version10beta281: spec
	<version: '1.0-beta.28.1' imports: #('1.0-beta.28-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '- fix MetacelloProject>>stableVersion and MetacelloProject>>lastVersion'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '1/21/2011 09:33'.
		spec 
			project: 'Gofer Core' with: '1.0.2.2';
			project: 'Gofer Tests' with: '1.0.2.2'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.457';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.505';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.24';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.80';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.139';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.29';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-DaleHenrichs.87'. ].

	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.19'. ].

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
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.24'. ].

	spec for: #'pharo1.2.x' do: [
		spec 
			project: 'OB' with: '1.2.3';
			project: 'ProfStef' with: '1.6'. ].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10'. ].
