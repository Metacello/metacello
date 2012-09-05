versions-31
version310welcome: spec
	<version: '3.1.0-welcome' imports: #('3.1.0-welcome-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'Seaside-Welcome' with: 'Seaside-Welcome-pmm.41';
			package: 'Seaside-Tests-Welcome' with: 'Seaside-Tests-Welcome-lr.6' ].
		
	spec for: #'squeak' do: [
		spec package: 'Seaside-Squeak-Welcome' with: 'Seaside-Squeak-Welcome-NickAger.1' ].


	spec for: #'pharo' do: [
		spec 
			package: 'Seaside-Pharo-Welcome' with: 'Seaside-Pharo-Welcome-NickAger.2' ].
		
	spec for: #'gemstone' do: [
		spec
			package: 'Seaside-GemStone-Welcome' with: 'Seaside-GemStone-Welcome-DaleHenrichs.1' ]
