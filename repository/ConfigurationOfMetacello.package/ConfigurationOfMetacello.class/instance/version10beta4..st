versions
version10beta4: spec
	<excludedValidationIssues: #('1.0-beta.4' #(noVersionSpecified))>
	<version: '1.0-beta.4' imports: #('1.0-beta.3-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: 'Bugfixes:
- add platform attribute tests
- fix bug in project reference
- need to pass project into constructor (sometimes)
- duplication of #projectAttributes
- correct update package logic when package branches involved (<package name>.<branch name>-<author>.<version number>'.
		spec author: 'dkh'.
		spec timestamp: '10/15/2009 11:41'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.67';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.273';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.205';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.13';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.12';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.27';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.1';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.1';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.4';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.1'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.4'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].