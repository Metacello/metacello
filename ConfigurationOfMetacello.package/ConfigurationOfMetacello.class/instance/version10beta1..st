versions
version10beta1: spec
	<version: '1.0-beta.1' imports: #('1.0-beta.0-baseline')>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: 'Bugfixes:
- change base version name for spawn method
- make sure author and timestamp included by spawn 
- fix file duplication for spawn method'.
		spec author: 'dkh'.
		spec timestamp: '10/10/2009 14:58'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.64';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.268';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.196';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.12';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.25';
			package: 'Metacello-ConfigTests' with: 'Metacello-ConfigTests-dkh.7';
			package: 'Metacello-ReferenceTests' with: 'Metacello-ReferenceTests-dkh.1'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.4'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.1'.].