versions
version10beta16: spec
	<version: '1.0-beta.16' imports: #('1.0-beta.16-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'beta'.
		spec description: '- put Gofer package in Metacello repository'.
		spec author: 'dkh'.
		spec timestamp: '12/01/09 16:22:42'.
		spec 
			package: 'Gofer' with: 'Gofer-lr.83';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.302';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.259';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.18';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.37';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.4';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.2';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.11';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.4'.].
	spec for: #'gemstone' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.9'.].
	spec for: #'pharo' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.7'.].
	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.3'.].