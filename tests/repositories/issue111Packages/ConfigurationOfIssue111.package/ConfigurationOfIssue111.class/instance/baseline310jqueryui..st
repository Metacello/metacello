baselines-31
baseline310jqueryui: spec
	<version: '3.1.0-jqueryui-baseline' imports: #('3.1.0-jquery-baseline')>

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec 
			package: 'JQuery-UI' with: [
				spec requires: #('JQuery-Core' ) ];
			package: 'JQuery-Tests-UI' with: [
				spec requires: #('JQuery-UI' 'JQuery-Tests-Core' ) ].
		spec 
			group: 'JQueryUI' with: #('JQuery-UI');
			group: 'JQueryUI Tests' with: #('JQuery-Tests-UI' );
			group: 'JQueryUI Examples' with: #('JQuery-Tests-UI' ) ].
		
	spec for: #'gemstone' do: [
		spec repository: 'http://seaside.gemstone.com/ss/Seaside30'.
		spec 
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone' ].