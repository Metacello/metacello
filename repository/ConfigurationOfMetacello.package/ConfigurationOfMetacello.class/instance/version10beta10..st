versions
version10beta10: spec
	<excludedValidationIssues: #('1.0-beta.10' #(noVersionSpecified))>
	<version: '1.0-beta.10' imports: #('1.0-beta.5-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- GemStone-specific mods
- improve error message for missing import
- fix a couple of bugs in spawn new version
- if versionString is not specified in project reference, use #latestVersion of the project
- ''Update Package Method'' command updates the versionString for project reference to #currentVersion of the project
- ''Spawn New Version'' command spawns entry for proejct reference using #currentVersion of the project
- latest version of configuration package is loaded if the project reference refers to a version whose blessing is #development
- refactor #saveProject
- add #transact: to platform to support GemStone optional transactions
- define querying protocol (public access)
- use literal arrays instead of array constructors _everywhere_
- clean up printing
- refine querying API
- extend tutorial to cover querying API
'.
		spec author: 'dkh'.
		spec timestamp: '10/25/2009 11:34'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.70';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.285';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.222';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.18';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.29';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.4';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.1';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.11';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.7'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].