versions
version10beta9: spec
	<excludedValidationIssues: #('1.0-beta.9' #(noVersionSpecified))>
	<version: '1.0-beta.9' imports: #('1.0-beta.5-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- second cut at package query api for MetacellMCVersion requested by Simon, Read the method comments for documentation:
	- groups
	- packages
	- projects
	- packagesForSpecNamed:
	- allPackagesForSpecNamed:
- add #repository:username:password: to configuration API in support of repositories that require authentication.'.
		spec author: 'dkh'.
		spec timestamp: '10/22/2009 10:38'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.70';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.279';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.215';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.16';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.15';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.27';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.3';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.1';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.10';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.3'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.5'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].