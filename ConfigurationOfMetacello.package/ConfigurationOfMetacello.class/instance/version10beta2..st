versions
version10beta2: spec
	<version: '1.0-beta.2' imports: #('1.0-beta.0-baseline')>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: 'Bugfixes:
- change name of method used for bootstrapping to avoid confusion with methods actually used for loading.
- port to Squeak (Squeak3..10.10.2-Trunk-090912)'.
		spec author: 'dkh'.
		spec timestamp: '10/12/2009 13:31'.
		spec 
			package: 'Gofer' with: 'Gofer-dkh.65';
			package: 'Metacello-Core' with: [
				spec
					file: 'Metacello-Core-dkh.268';
					includes: #('Metacello-Reference' ) ];
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.197';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.12';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.25';
			package: 'Metacello-ConfigTests' with: 'Metacello-ConfigTests-dkh.7';
			package: 'Metacello-ReferenceTests' with: 'Metacello-ReferenceTests-dkh.1'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.4'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].