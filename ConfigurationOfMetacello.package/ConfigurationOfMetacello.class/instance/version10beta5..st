versions
version10beta5: spec
	<excludedValidationIssues: #('1.0-beta.5' #(noVersionSpecified))>
	<version: '1.0-beta.5' imports: #('1.0-beta.5-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- GemStone port
- fix a bug in #project:copyFrom:with:
- rewrite null loader to use IVs for recording state
- get started on project ref tutorial
- ensure that imported versions exist
- use Gofer for direct loading of packages like from pojects, since configuration must be loaded immediately whether or not w are doing atomic/linear loads
- add project load test (coverage for Doru''s bug report)'.
		spec author: 'dkh'.
		spec timestamp: '10/18/2009 10:41'.
		spec 
			package: 'Gofer' with: 'Gofer-dkh.68';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.276';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.208';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.15';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.13';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.27';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.2';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.1';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.7';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.2'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.5'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].