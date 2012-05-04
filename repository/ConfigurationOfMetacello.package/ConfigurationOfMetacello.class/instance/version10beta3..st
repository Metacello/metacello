versions
version10beta3: spec
	<excludedValidationIssues: #('1.0-beta.3' #(noVersionSpecified))>
	<version: '1.0-beta.3' imports: #('1.0-beta.3-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: 'Bugfixes:
- update to latest Gofer (Gofer-lr.67)
- fix a package overrides: bug
- pull in some old tests that still apply
- recast tutorial to new API plus tutorial tests
- fix platform attribute bug
- use strings instead of symbols for imports
- class-side project
- fix doit bug
- tools load ''ALL''
- deactive ''Update Repositories'' command'.
		spec author: 'dkh'.
		spec timestamp: '10/14/2009 10:06'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.67';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.271';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.201';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.13';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.12';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.27';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.1';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.1';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.2';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.1'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.4'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].