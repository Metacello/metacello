versions
version10beta0: spec
	<version: '1.0-beta.0' imports: #('1.0-beta.0-baseline')>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: 'Beta release introducing the shiny new API'.
		spec author: 'dkh'.
		spec timestamp: '10/9/2009 14:13'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.64';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.266';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.194';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.11';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.24';
			package: 'Metacello-ConfigTests' with: 'Metacello-ConfigTests-dkh.6';
			package: 'Metacello-ReferenceTests' with: 'Metacello-ReferenceTests-dkh.1'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.4'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.1'.].