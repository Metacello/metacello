versions
version10beta13: spec
	<version: '1.0-beta.13' imports: #('1.0-beta.13-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- fix a bug in current version algorithm
- improve current version algorithm
- pick up latest Gofer
'.
		spec author: 'dkh'.
		spec timestamp: '11/5/2009 15:46'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.77';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.300';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.249';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.18';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.37';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.4';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.2';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.11';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.7'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].