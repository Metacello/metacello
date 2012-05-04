baselines
baseline10beta28ea3: spec
	<version: '1.0-beta.28-ea.3-baseline'>

	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://seaside.gemstone.com/ss/metacello'.
		spec repository: 'http://www.squeaksource.com/metacello'.
		spec
			project: 'Gofer Core' with: [
				spec
					className: 'ConfigurationOfGofer';
					versionString: '1.0-baseline';
					loads: #('Core' );
					file: 'ConfigurationOfGofer';
					repository: 'http://www.squeaksource.com/MetacelloRepository';
					repository: 'http://seaside.gemstone.com/ss/metacello'. ];
			project: 'Gofer Tests' copyFrom: 'Gofer Core' with: [
				spec loads: #('Tests' ) ];
			yourself.
		spec 
			package: 'Metacello-Base';
			package: 'Metacello-ToolBox' with: [
				spec requires: 'Metacello-Base'. ];
			package: 'Metacello-Core' with: [
				spec 
					requires: 'Metacello-Base';
					includes: #('Metacello-MC' 'Metacello-Platform' ). ];
			package: 'Metacello-MC' with: [
				spec requires: #('Metacello-Core' 'Gofer Core' ). ];
			package: 'Metacello-Platform' with: [
				spec requires: #('Metacello-MC' ). ];
			package: 'Metacello-Reference' with: [
				spec requires: #('Metacello-MC' ). ];
			package: 'Metacello-Tutorial' with: [
				spec requires: #('Metacello-Core' ). ];
			package: 'Metacello-TestsCore' with: [
				spec requires: #('Metacello-Core' ). ];
			package: 'Metacello-TestsMC' with: [
				spec 
					postLoadDoIt: #testsMC10beta25PostLoadDoIt;
					requires: #('Metacello-MC' 'Gofer Tests' ). ];
			package: 'Metacello-TestsReference' with: [
				spec requires: #('Metacello-Reference' ). ];
			package: 'Metacello-TestsTutorial' with: [
				spec requires: #('Metacello-Tutorial' ). ];
			package: 'OB-Metacello' with: [
				spec requires: #('Metacello-Platform' 'Metacello-Core' 'Metacello-ToolBox'). ];
			yourself.

		spec 
			group: 'default' with: #('Metacello-Core' 'Metacello-ToolBox' );
			group: 'Base Configuration' with: #('Metacello-Base' );
			group: 'Tutorial' with: #('Metacello-Tutorial' 'Metacello-Reference' );
			group: 'UI' with: #('OB-Metacello' );
			group: 'Tests' with: #('Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC' 'Metacello-TestsReference' );
			yourself.].
	spec for: #squeakCommon do: [
		spec
			project: 'Help System' with: [
				spec
					className: 'ConfigurationOfHelpSystem';
					versionString: '1.0-baseline';
					loads: #('Core' );
					file: 'ConfigurationOfHelpSystem';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			project: 'OB' with: [
				spec
					className: 'ConfigurationOfOmniBrowser';
					versionString: '1.1-baseline';
					loads: #('Core' );
					file: 'ConfigurationOfOmniBrowser';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			yourself.
		spec
			package: 'Metacello-TestsPlatform' with: [
				spec 
					requires: #('Metacello-Platform' );
					file: 'Metacello-TestsPlatform.squeakCommon'. ];
			package: 'Metacello-Help' with: [
				spec requires: 'Help System'. ];
			package: 'OB-Metacello' with: [
				spec requires: #('OB' ). ];
			yourself.
		spec
			group: 'Tests' with: #('Metacello-TestsPlatform' );
			group: 'Tutorial' with: #('Metacello-Help' );
			yourself.].
	spec for: #pharo do: [
		spec 
			project: 'ProfStef' with: [
				spec
					className: 'ConfigurationOfProfStef';
					versionString: '1.0-baseline';
					file: 'ConfigurationOfProfStef';
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			yourself.
		spec
			package: 'Metacello-ProfStef' with: [
				spec requires: #('Metacello-Core' 'ProfStef' 'Metacello-ToolBox' ). ];
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo';
			yourself.
		spec
			group: 'default' with: #('Metacello-Help');
			group: 'Tutorial' with: #('Metacello-ProfStef');
			yourself.].
	spec for: #squeak do: [
		spec
			package: 'Metacello-Platform' with: 'Metacello-Platform.squeak';
			yourself.].
	spec for: #gemstone do: [
		spec
			project: 'Monticello' with: [
				spec
					className: 'ConfigurationOfGsMonticello';
					file: 'ConfigurationOfGsMonticello';
					repository: 'http://seaside.gemstone.com/ss/monticello' ];
			yourself.
		spec 
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone';
			package: 'Metacello-TestsPlatform' with: [
				spec 
					requires: #('Metacello-Platform' );
					file: 'Metacello-TestsPlatform.gemstone'. ];
			yourself.
		spec
			group: 'Tests' with: #('Metacello-TestsPlatform' );
			yourself. ].