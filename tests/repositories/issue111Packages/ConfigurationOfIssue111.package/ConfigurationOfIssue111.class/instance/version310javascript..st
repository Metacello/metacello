versions-31
version310javascript: spec
	<version: '3.1.0-javascript' imports: #('3.1.0-javascript-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'Javascript-Core' with: 'Javascript-Core-pmm.95';
			package: 'Javascript-Tests-Core' with: 'Javascript-Tests-Core-pmm.68' ].
		
	spec for: #'squeakCommon' do: [
		spec
			package: 'Javascript-Pharo-Core' with: 'Javascript-Pharo-Core-pmm.10';
			package: 'Javascript-Pharo20-Core' with: 'Javascript-Pharo20-Core-pmm.3';
			package: 'Javascript-Tests-Pharo-Core' with: 'Javascript-Tests-Pharo-Core-lr.1' ].
		
	spec for: #'gemstone' do: [
		spec 
			package: 'Javascript-GemStone-Core' with: 'Javascript-GemStone-Core-DaleHenrichs.4' ]