versions
version10beta29: spec
	<version: '1.0-beta.29' imports: #('1.0-beta.29-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
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
- MetacelloCurrentVersionTest>>testIssue118 added to validate the fix
- OPEN 1.0-beta.29 FOR DEVELOPMENT ***************** following from 1.0-beta.28.4 merge
- improve MetacelloToolBox class>>stripVersionStringForSelector: algorithm
- fix Issue 108:	Need to update Metacello (tests and Gofer config) to integrate changes from Pharo Issue 3660
  http://code.google.com/p/metacello/issues/detail?id=108
- add MetacelloToolBox class>>stableVersion:for:platformAttribute: for MetacelloBrowser
- warn about newer versions when saving modified packages
- check for possibly newer versions when saving configuration
- testing (so there''s a halt in here too)
- warning is better than a halt ... any day
pick up patch for Pharo  Issue 3763: assert failure during Decompiler>>popIntoTemporaryVariable:
  http://code.google.com/p/pharo/issues/detail?id=3763
- integrate the parallel currentVersion calculation ... no ill affectcts yet
- another sent but not implemented cleanup for GemStone
- fix a problem with a "naked" project: call in a version method ... run into this error during automated generation
- proposed fix for Issue 122: misleading error message regarding stable versions
  http://code.google.com/p/metacello/issues/detail?id=122
- parrallel current version calculations...(actually found real-life case where parallel is better)
***************** preceding from 1.0-beta.28.4 merge
- open 1.0-beta.29 for development
- merge 1.0-beta.28.3.2 and 1.0-beta.28.4 development threads
- turns out that MetacelloBrowser needs the new development stuff anyway & MetacelloBrowser can live in a development image anyway 
- MetacelloIssue115TestCase currently in limbo

- tests for Issue 115
- getting started on a caching scheme for goferReferences for use during the fetch phase ...
- SIGNIFICANT speedup for fetch:
  - cache repository contents for duration of fetch cycle
  - use packageCache (when available) for loading version info
1.0-beta.29 (dkh.582):
- cache only network-based repositories in MetacelloGofer
- clear cacheGofer when setting cacheRepository for MetacelloLoaderPolicy
1.0-beta.29 (dkh.583):
- clear ensuredMap when setting cacheRepository for MetacelloLoaderPolicy
1.0-beta.29 (dkh.584):
- add in support for branching configurations (mcz level branch)
1.0-beta.29 (dkh.585):
- help system loaded by default in Squeak, too
- add configuration help support
1.0-beta.29 (dkh.588):
- config help should allow for inclusion of a class (like custom help)
- include MetacelloHelp (if installed) in ConfigurationOfMetacello help..
1.0-beta.29 (dkh.590):
- in case HelpSystem not installed ...
1.0-beta.29 (dkh.591):
- better logic for default installation help
1.0-beta.29 (dkh.592):
- another tweak to logic: #stable version, class-side load, latest version load
- fix a bug
1.0-beta.29 (dkh.594):
- support for update projects command in MetacelloBrowser
1.0-beta.29 (dkh.595):
- restore a method to avoid upgrade issues
tweak
1.0-beta.29 (dkh.598):
- fixed a bug in MetacelloToolBox class>>saveModifiedDevelopmentPackages:for:description:

1.0-beta.29 ():
- implement GoferVersionReference>>metacelloPackageNameWithBranch ... improve branching support
1.0-beta.29 (dkh.600):
- add support for _creating_ configuration branches
1.0-beta.29 (dkh.601):
- use Gofer 1.0.5 (integerate Pharo branch changes into Squeak and GemStone versions)
- clean up repositories left in default MCRepositoryGroup ...
1.0-beta.29 (dkh.606):
- merge changes from 1.0-beta.28.5
1.0-beta.29 (dkh.607):
- remove expectedFailures ... 
1.0-beta.29 (dkh.608):
- 379 run, 379 passes, 0 expected failures, 0 failures, 0 errors, 0 unexpected passes
- tests finalized for issues 108, 115, and 118
1.0-beta.29 (dkh.611):
- empty package Metacello-Issue3758, so that expectedFailures aren''t left intact
1.0-beta.29 (dkh.612):
- better information in transcript on retry
1.0-beta.29 (dkh.612):
- add MetacelloToolBox class>>currentlyLoadedExtensionClassesInVersion in support of Naviode
1.0-beta.29 (dkh.615):
- fix Issue 112: direct version load (upgrade) of config doesn''t update already loaded mcz files
  http://code.google.com/p/metacello/issues/detail?id=112

1.0-beta.29 (dkh.619):
- defaultTimeout to be compatible with Squeak test cases'.
		spec author: 'dkh'.
		spec timestamp: '6/7/2011 16:02'.
		spec 
			project: 'Gofer Core' with: '1.0.5';
			project: 'Gofer Tests' with: '1.0.5'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.465';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.522';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.81';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.153';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.31';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.105'. ].

	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.20'. ].

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
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.25'. ].

	spec for: #'pharo1.2.x' do: [
		spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2'. ].

	spec for: #'pharo1.3.x' do: [
		spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2'. ].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10'. ].
