versions
version10beta12: spec
	<version: '1.0-beta.12' imports: #('1.0-beta.11-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'beta'.
		spec description: '-convert to using ConfigurationOfMetacello convention
- fix updateRepositories bug (update repository for loaded packages only)
- #repositoryFor:from: ... more GLASS support
- record last version loaded and list of packages loaded for each configuration (optional)
- use last list of packages loaded last when loading packages using tools
- improve promptForVersion algorithm to show current version and reduce version list to logical choices
- fix version number bug when version is empty. add tests
'.
		spec author: 'dkh'.
		spec timestamp: '11/03/09 11:07:27'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.76';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.295';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.245';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.18';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.37';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.4';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.2';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.11';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #'gemstone' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.7'.].
	spec for: #'pharo' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].