versions
version10beta25: spec
	<version: '1.0-beta.25' imports: #('1.0-beta.25-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- pick up Gofer 1.0.2
- fix Issue 10: http://code.google.com/p/metacello/issues/detail?id=10 "''save packages'' should recurse through projects"
- fix Issue 24: http://code.google.com/p/metacello/issues/detail?id=24 "Gofer #fetch support"
- fix Issue 31: http://code.google.com/p/metacello/issues/detail?id=31 "Handle boundary between #atomic and #linear loads ..."
- fix Issue 32: http://code.google.com/p/metacello/issues/detail?id=32 "Connect repositories as MCServerDirectory rather than MCDirectory"
- fix Issue 48: http://code.google.com/p/metacello/issues/detail?id=48 "Should have #loadReport message for loader..."
- fix Issue 56: http://code.google.com/p/metacello/issues/detail?id=56 "save configurtion that uses Gofer>>commit:"
- fix Issue 57: http://code.google.com/p/metacello/issues/detail?id=57 "specificy method category for version category in Metacello version constructor"
- fix Issue 58: http://code.google.com/p/metacello/issues/detail?id=58 "make #file: optional in project reference specification"
- fix Issue 59: http://code.google.com/p/metacello/issues/detail?id=59 "repository overrides should be used for MetacelloPackageSpec>>load"
- fix Issue 60: http://code.google.com/p/metacello/issues/detail?id=60 "bypass progress bars...."
- fix Issue 64: http://code.google.com/p/metacello/issues/detail?id=64 "update package methods has extra file entry"
- fix Issue 66: http://code.google.com/p/metacello/issues/detail?id=66 "loading latest broken by new code in 1.0-beta.24" [MERGE]
- #fetch and #fetch: added to MetacelloMcVersion. #fetch and #fetch: correspond to #load and #load: but only download the mcz files to a cacheRepository (controlled by version #loadPolicy)
- #fetchProject, #fetchProject:, #updateProject: added to support direct fetch of a project (ala #updateProject)
- implement version #record/#record:
- implement version #silently: for Issue 60
- implement non-interactive commit support using gofer: MetacelloMCProject>>goferCommitProject:, MetacelloPackageSpec>>goferCommitPackage:
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '3/23/2010 15:24'.
		spec 
			project: 'Gofer Core' with: '1.0.2';
			project: 'Gofer Tests' with: '1.0.2'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.358';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.386';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.29';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.20';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.55';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.14';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.8';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.90';
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