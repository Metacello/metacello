versions
version10beta6: spec
	<excludedValidationIssues: #('1.0-beta.6' #(noVersionSpecified))>
	<version: '1.0-beta.6' imports: #('1.0-beta.5' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: 'Bugfixes:
- asNumber throws Error (as of 10487) and Errors are not resumable
- bump up ensureMetacello methods to use versions from 1.0-beta.6
- use latest version of Gofer'.
		spec author: 'dkh'.
		spec timestamp: '10/19/2009 10:50'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.70';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.277';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.209';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.14'.].