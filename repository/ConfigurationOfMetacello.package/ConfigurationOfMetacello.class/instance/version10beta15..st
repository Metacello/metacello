versions
version10beta15: spec
	<version: '1.0-beta.15' imports: #('1.0-beta.14-baseline' )>

	spec for: #common do: [
		spec blessing: #development.
		spec description: '- fix ''Spawn New Version'' command
- tweak packageSpec shortcut printing - fine tune use of #overrides:'.
		spec author: 'dkh'.
		spec timestamp: '11/21/2009 11:49'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.83';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.302';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.258';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.18';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.37';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.4';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.2';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.11';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #gemstone do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.9'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].