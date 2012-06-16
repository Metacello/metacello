versions
version10beta30: spec
	<version: '1.0-beta.30' imports: #('1.0-beta.30-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '1.0-beta.30 (dkh.621):
- another round of performance improvements with significant speedups for #currentVersion, #project,  #versionStatus and friends
1.0-beta.30 (dkh.622):
- minor tweaks for performance enhancements
- tweak MetacelloToolBox class>>saveModifiedPackagesAndConfigurationIn:description: so that description is updated when you package updates are needed.
1.0-beta.30 (dkh.623):
- persistent author initials can be set by defining #''GS_tODE_AuthorInitials'' in UserGlobals with desired author initials string (in support of tODE) [GemStone only]
1.0-beta.30 (dkh.624):
- allow configuration branches to be used in a project reference (className: is name sans branch, file: is name with branch)
1.0-beta.30 (dkh.625):
- fix validation when branched configuration is used
1.0-beta.30 (dkh.626):
- fix Issue 136: load of referenced project can fail with missing version error
  http://code.google.com/p/metacello/issues/detail?id=136
1.0-beta.30 (dkh.627):
- fix Issue 146:unrecognized SystemVersion results in assuming system is on #gemstone...
  http://code.google.com/p/metacello/issues/detail?id=146
- tests pass in Pharo1.4, though ProfStef apparently has not been ported (yet)'.
		spec author: 'dkh'.
		spec timestamp: '9/9/2011 15:48'.
		spec 
			project: 'Gofer Core' with: '1.0.5';
			project: 'Gofer Tests' with: '1.0.5'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.467';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.527';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.81';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.155';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.32';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-DataCurator.106'. ].

	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.237.2'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.21'. ].

	spec for: #'squeakCommon' do: [
		spec 
			project: 'OB' with: #'stable';
			project: 'Help System' with: '1.1'.
		spec 
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2';
			package: 'Metacello-Help' with: 'Metacello-Help-dkh.11'. ].

	spec for: #'pharo' do: [
		spec project: 'ProfStef' with: #'stable'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.10';
			package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.27'. ].

	spec for: #'pharo1.2.x' do: [
		spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2'. ].

	spec for: #'pharo1.3.x' do: [
		spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2'. ].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10'. ].
