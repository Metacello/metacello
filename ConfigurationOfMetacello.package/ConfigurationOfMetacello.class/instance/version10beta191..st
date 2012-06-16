versions
version10beta191: spec
	<excludedValidationIssues: #('1.0-beta.19.1' #(noVersionSpecified))>
	<version: '1.0-beta.19.1' imports: #('1.0-beta.19-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- fix Issue 39: http://code.google.com/p/metacello/issues/detail?id=39 "WB at end of ConfigurationOfPharo load"
'.
		spec author: 'dkh'.
		spec timestamp: '1/8/2010 14:45'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.319';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.292';
			package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.26';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.17';
			package: 'OB-Metacello' with: 'OB-Metacello-dkh.40';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.11';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.3';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.26';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.5'.].
	spec for: #'Gofer-Core' do: [
		spec package: 'Gofer-Core' with: 'Gofer-Core-AdrianLienhard.114'.].
	spec for: #Gofer do: [
		spec package: 'Gofer' with: 'Gofer-lr.109'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.236'.
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.11'.].
	spec for: #squeakCommon do: [
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.11'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.4'.].