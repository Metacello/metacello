versions
version10beta312: spec
	<version: '1.0-beta.31.2' imports: #('1.0-beta.31.1-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec
				description:
					'1.0-beta.31.2 (dkh.649):
- fix Issue 163: MetacellMCProjectSpec>>ensureProjectLoaded doesn''t honor cacheRepository: or overrideRepository:
  http://code.google.com/p/metacello/issues/detail?id=163
1.0-beta.31.2 (dkh.650):
- clean up logging for Issue 163
1.0-beta.31.2 (dkh.651):
- more logging clean up
1.0-beta.31.2 (dkh.652):
- during ensured configuration loads, need to clear more of the cache.
1.0-beta.31.2 (dkh.653):
- when loading a new version of a config, ALL references to the project need to be nuked.
1.0-beta.31.2 (dkh.654):
- cached packages should only be loaded during an ensureLoad.
1.0-beta.31.2 (dkh.655):
- fix Issue 150: #stable version shouldn''t cause upgrade from project reference
  http://code.google.com/p/metacello/issues/detail?id=150'.
			spec author: 'dkh'.
			spec timestamp: '1/3/2012 11:15'.
			spec
				project: 'Gofer Core' with: '1.0.5.1';
				project: 'Gofer Tests' with: '1.0.5.1'.
			spec
				package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
				package: 'Metacello-Core' with: 'Metacello-Core-dkh.468';
				package: 'Metacello-MC' with: 'Metacello-MC-dkh.538';
				package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
				package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
				package: 'OB-Metacello' with: 'OB-Metacello-dkh.82';
				package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
				package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
				package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.161';
				package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.32';
				package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.107' ].
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'OB' with: #stable;
				project: 'Monticello' with: '0.242'.
			spec
				package: 'Metacello-MC' with: [ spec preLoadDoIt: #gemstone10beta24PreLoadDoIt ];
				package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-dkh.2';
				package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.23' ].
	spec
		for: #squeakCommon
		do: [ 
			spec
				project: 'OB' with: #stable;
				project: 'Help System' with: '1.1'.
			spec
				package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2';
				package: 'Metacello-Help' with: 'Metacello-Help-dkh.11' ].
	spec
		for: #pharo
		do: [ 
			spec project: 'ProfStef' with: #stable.
			spec
				package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.10';
				package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-DaleHenrichs.1';
				package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.27' ].
	spec for: #'pharo1.2.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
	spec for: #'pharo1.3.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
	spec for: #squeak do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10' ]