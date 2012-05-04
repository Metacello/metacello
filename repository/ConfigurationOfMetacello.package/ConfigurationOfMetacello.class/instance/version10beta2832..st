versions
version10beta2832: spec
	<version: '1.0-beta.28.3.2' imports: #('1.0-beta.28.3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '- fix a problem with a "naked" project: call in a version method ... run into this error during automated generation
- fix Issue 123: broken development scenario
  http://code.google.com/p/metacello/issues/detail?id=123
- fix Issue 120:lessons methods disapppeared in Metacello-Tutorial-DaleHenrichs.24
  http://code.google.com/p/metacello/issues/detail?id=120
- proposed fix for Issue 122: misleading error message regarding stable versions
  http://code.google.com/p/metacello/issues/detail?id=122
- parrallel current version calculations...(actually found real-life case where parallel is better)
- minor toolbox tweak ... commitMethod should be okay with no methodSpec ... just noop
- fix Issue 118: dirty package after merge skews currentVersion calculation
  http://code.google.com/p/metacello/issues/detail?id=118
- MetacelloCurrentVersionTest>>testIssue118 added to validate the fix'.
		spec author: 'dkh'.
		spec timestamp: '3/20/2011 19:52'.
		spec 
			project: 'Gofer Core' with: '1.0.2.2';
			project: 'Gofer Tests' with: '1.0.2.2'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.463';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.510';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.81';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.143';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.29';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.95'. ].

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
