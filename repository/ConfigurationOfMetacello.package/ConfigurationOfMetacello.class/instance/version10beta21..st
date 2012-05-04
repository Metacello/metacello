versions
version10beta21: spec
	<version: '1.0-beta.21' imports: #('1.0-beta.21-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- fix new tests so that they run on GemStone and don''t collide with existing packages
- fix Issue 41: http://code.google.com/p/metacello/issues/detail?id=41 "Trouble with nested ProgressInitiationException in certain circumstances"
- fix Issue 42: http://code.google.com/p/metacello/issues/detail?id=42 "ConfigurationOfSeaside* should use supplyingAnswers:"
- fix Issue 43: http://code.google.com/p/metacello/issues/detail?id=43 "Eliminate use of #versionInfoFor:from:do: "
- Metacello now uses Gofer for all of its interactions with Monticello (a few pockets of workingCopy still exist:)
- pick up latest Gofer-Core-lr.115 and Gofer-Tests
- some more version caching for speed
- better workingCopy resolution for MetacelloCachingGoferResolvedReference
- adjust tests - no longer inheriting pragmas ... too expensive
- introduce valueSupplyingMetacelloAnswers: to work around Pharo Issue 1824 http://code.google.com/p/pharo/issues/detail?id=1824
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '1/16/2010 12:47'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.321';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.302';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.26';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-tbn.19';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.40';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.11';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.3';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.34';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.5'.].
	spec for: #'Gofer-Core' do: [
		spec 
			package: 'Gofer-Core' with: 'Gofer-Core-lr.115';
			package: 'Gofer-Tests' with: 'Gofer-Tests-lr.113'.].
	spec for: #Gofer do: [
		spec package: 'Gofer' with: 'Gofer-lr.113'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.236'.
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.12'.].
	spec for: #squeakCommon do: [
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.12'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.4'.].