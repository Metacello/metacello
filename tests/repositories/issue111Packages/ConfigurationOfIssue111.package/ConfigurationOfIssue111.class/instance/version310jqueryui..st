versions-31
version310jqueryui: spec
	<version: '3.1.0-jqueryui' imports: #('3.1.0-jqueryui-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'JQuery-UI' with: 'JQuery-UI-lr.83';
			package: 'JQuery-Tests-UI' with: 'JQuery-Tests-UI-lr.83' ].
		
	spec for: #'gemstone' do: [
		spec 
			package: 'JQuery-UI' with: 'JQuery-UI.gemstone-dkh.81' ]
