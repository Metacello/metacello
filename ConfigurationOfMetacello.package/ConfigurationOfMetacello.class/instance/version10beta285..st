versions
version10beta285: spec
	<version: '1.0-beta.28.5' imports: #('1.0-beta.28.3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'copy from 1.0-beta.28.3.1.1 ... 1.0-beta.28.5 is a better name:)
1.0-beta.28.3.1.1 (dkh.603):
- cherry pick the clean up repository code from Metacello-TestsMC-dkh.146
- tests green in Squeak4.2alpha update #10892
  376 run, 375 passes, 1 expected failures, 0 failures, 0 errors, 0 unexpected passes
1.0-beta.28.3.1.1 (dkh.604):
- clean up a few more repositories ...'.
		spec author: 'dkh'.
		spec timestamp: '4/18/2011 18:40'.
		spec 
			project: 'Gofer Core' with: '1.0.5';
			project: 'Gofer Tests' with: '1.0.5'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.461';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.507';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.24';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.81';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.148';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.30';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-DaleHenrichs.88'. ].

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
			project: 'ProfStef' with: '1.6'.
		spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.1'. ].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10'. ].
