versions
version10beta23: spec
	<version: '1.0-beta.23' imports: #('1.0-beta.22-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'beta'.
		spec description: '- port to Squeak3.9.1-final-7075, Squeak3.10.2-7179-basic, Squeak3.10.2-Trunk-091128 and Squeak3.11-8931-alpha
- add #unloadMetacello to MetacelloConfigTemplate
- fix Issue25 : http://code.google.com/p/metacello/issues/detail?id=25 "currentVersion cache is too sticky ..."
- full frontal assault on findCurrentVersion and currentVersion algorithms ... corner implementation with a brigage of tests
- fix a bug in GoferResolvedReference>>compare:using: related to branch comparison found during frontal assault!
- version #versionStatus provides additional info for using currentVersion
- deleted a bunch of methods (redundant,  confusing, not interesting and no longer used):
  - MetacelloVersion>>isCurrentCovering:
  - MetacelloProject>>currentVersionComparison:to:covering:
  - MetacelloProject>>currentVersionCovering:
  - MetacelloProject>>findCurrentVersion
  - MetacelloMCVersionSpec>>isCurrentCovering:
  - MetacelloMCVersionSpec>>isPartiallyCurrentAgainst:
  - MetacelloMCProjectSpec>>isCurrent
  - MetacelloProjectReferenceSpec>>compareVersionForLoad:using:
  - MetacelloAbstractPackageSpec>>compareVersionForLoad:using:
  - MetacelloMCVersionSpec>>isPartiallyCurrentFor:
  - MetacelloProjectReferenceSpec>>isPartiallyCurrentUsing:
  - MetacelloMCProjectSpec>>comparePartialVersion:using:
  - MetacelloProject>>partialVersionComparison:to:covering:
  - MetacelloMCProject>>projectPackage
  - MetacelloMCVersionSpec>>currentVersionComparison:covering:
  - MetacelloMCVersion>>currentVersionComparison:covering:
  - MetacelloVersion>>currentVersionComparison:covering:
  - MetacelloProjectReferenceSpec>>isPartiallyCurrentUsing:
  - MetacelloMCProjectSpec>>compareVersionForLoad:using:
  - MetacelloMCVersionSpec>>isCurrent
  - MetacelloPackageSpec>>compareVersion:using:
  - MetacelloPackageSpec>>isCurrentUsing:
  - MetacelloMCProjectSpec>>compareVersion:using:
  - MetacelloMCProjectSpec>>isCurrentUsing:
  - MetacelloAbstractPackageSpec>>isCurrentUsing:
  - MetacelloGroupSpec>>isCurrentUsing:
  - MetacelloProjectReferenceSpec>>isCurrentUsing:
  - MetacelloProject>>currentVersionComparison:to:
  - MetacelloVersion>>isCurrent
  - MetacelloVersionSpec>>isCurrent
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '02/10/10 09:56:41'.
		spec 
			project: 'Gofer Core' with: '1.0';
			project: 'Gofer Tests' with: '1.0'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.348';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.332';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.28';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-tbn.19';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.40';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.13';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.8';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.66';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.5'.].
	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.236'.
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.14'.].
	spec for: #'squeakCommon' do: [
		spec project: 'OB' with: '1.1'.
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #'pharo' do: [
		spec project: 'ProfStef' with: '1.0'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.13'.].
	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.5'.].