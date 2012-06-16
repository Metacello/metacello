versions
version10beta262: spec
	<version: '1.0-beta.26.2' imports: #('1.0-beta.25-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- Pharo1.1 compat for OB-Metacello
- fix Issue 77: http://code.google.com/p/metacello/issues/detail?id=77 "later version of Project reference not loaded after old version already loaded"
- add MetacelloFetchingMCSpecLoader>>printOn: that prints out loadDirective, thus restoring correct #printOn: behavior for MetacelloNullRecordingMCSpecLoader since tutorial depends upon it..
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '5/21/2010 16:26 '.
		spec 
			project: 'Gofer Core' with: '1.0.2';
			project: 'Gofer Tests' with: '1.0.2'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.361';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.407';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.29';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.20';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.56';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.14';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.8';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.99';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-DaleHenrichs.7'.].
	spec for: #gemstone do: [
		spec project: 'Monticello' with: '0.236'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #gemstone10beta24PreLoadDoIt. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-DaleHenrichs.16'.].
	spec for: #squeakCommon do: [
		spec project: 'OB' with: '1.1.1'.
		spec package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2'.].
	spec for: #pharo do: [
		spec project: 'ProfStef' with: '1.0'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-DaleHenrichs.16'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.5'.].