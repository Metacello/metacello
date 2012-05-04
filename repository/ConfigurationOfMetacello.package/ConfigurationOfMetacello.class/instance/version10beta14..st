versions
version10beta14: spec
	<version: '1.0-beta.14' imports: #('1.0-beta.14-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'beta'.
		spec description: '- improve handling of #development project references. Loader is responsible for ensuring that #development projects have latest package loaded.
- use latest Gofer
- skip automatic loading of packages when working copy #needsSaving
- better loop termination logic for packageSpecsInLoadOrder
- fix logic for loading latest version of a project when versionString is not set (use latest, then last version)
- collect repositories from just the packages (ignoring projects) ... affects load latest logic
- fix #promptForVersion: ... include #development versions in listing
- GemStone attributes, now may include: #gemstone #''gs2.x'' #''gs2.3.x'' #''gs2.4.x'' and #''gs3.x'' for finer grainded resolution of Stone version
- fix a package loading logic bug found by Doru (loading latest)'.
		spec author: 'dkh'.
		spec timestamp: '11/16/2009 15:02'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.83';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.302';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.256';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.18';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.38';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.4';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.2';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.11';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #'gemstone' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.9'.].
	spec for: #'pharo' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].