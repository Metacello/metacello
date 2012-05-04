versions
version10beta26: spec
	<version: '1.0-beta.26' imports: #('1.0-beta.25-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- put comment in MetacelloMCProject>>#updateProject to warn about refreshing instance.
- helper messages: #cacheRepository: and #ignoreImage: added to MetacelloMCVersion
- refactor directive hierarchy for post/pre Load directives add #postLoadDo: and #preLoadDo: to round out API
- clean up null recording loader with respect to fetch and post/pre load doits
- directives weren''t being created correctly for post/pre load doits on packages .... now they are
- ConfigurationOfMetacello class>>alternateEnsureMetacello to be used if GemSource repository is inaccessible
- assorted tests
- #fetchPackage: added to MetacelloPackageSpec taking a MetacelloLoaderPolicy like #fetchProject: for MetacelloMCProjectSpec
'.
		spec author: 'DaleHenrichs'.
		spec timestamp: '4/12/2010 14:27'.
		spec 
			project: 'Gofer Core' with: '1.0.2';
			project: 'Gofer Tests' with: '1.0.2'.
		spec 
			package: 'Metacello-Core' with: 'Metacello-Core-DaleHenrichs.361';
			package: 'Metacello-MC' with: 'Metacello-MC-DaleHenrichs.393';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.29';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-DaleHenrichs.20';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.55';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.14';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.8';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-DaleHenrichs.92';
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