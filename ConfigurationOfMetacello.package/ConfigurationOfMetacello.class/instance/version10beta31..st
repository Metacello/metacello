versions
version10beta31: spec
	<version: '1.0-beta.31' imports: #('1.0-beta.31-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: '1.0-beta.31 (dkh.633);
- clean up port to GemStone
1.0-beta.31 (dkh.635):
- fix for GemStone version of Pharo Issue 4613 .... derive attributes from GemStone version string
- get Monticello configuration from correct repository
1.0-beta.31 (dkh.636):
- use Gofer 1.0.5.1 (for GemStone)
1.0-beta.31 (dkh.637):
- changing the comparison logic for Monticello branches. It used to be that branched Monticello packages had a funky sort order based on lenght of the branch, etc ... total malarkey really. For Metacello when a branched package is compared to a non-branched package that just just fail the comparisons and there is no "latest" relationship in either direction ... this has the effect of forcing an override of non-branched by branched and vice versa. Also if two versions differ in author name only, they compare equal ... no good can come of that situation no matter how you cut it.  Considering that I believe that GemStone is the only place where branched Monticello packages are regularly used in a configuration, I feel pretty confident that if I make GemStone happy everyone else will be happy as well.
1.0-beta.31 (dkh.638):
- previous checkin was too aggressive ... there needs to be a consistent package ordering scheme or else seesaw loading will ensue
- version number is the primary sorting key when package names are the same ... branch then author is used only when version numbers are the same '.
		spec author: 'dkh'.
		spec timestamp: '10/20/2011 14:33'.
		spec 
			project: 'Gofer Core' with: '1.0.5.1';
			project: 'Gofer Tests' with: '1.0.5.1'.
		spec 
			package: 'Metacello-Base' with: 'Metacello-Base-DaleHenrichs.19';
			package: 'Metacello-Core' with: 'Metacello-Core-dkh.467';
			package: 'Metacello-MC' with: 'Metacello-MC-dkh.529';
			package: 'Metacello-Reference' with: 'Metacello-Reference-DaleHenrichs.31';
			package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
			package: 'OB-Metacello' with: 'OB-Metacello-DaleHenrichs.81';
			package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
			package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-DaleHenrichs.14';
			package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.157';
			package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.32';
			package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.107'. ].

	spec for: #'gemstone' do: [
		spec project: 'Monticello' with: '0.237.2'.
		spec 
			package: 'Metacello-MC' with: [
				spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt'. ];
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-dkh.2';
			package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.22'. ].

	spec for: #'squeakCommon' do: [
		spec 
			project: 'OB' with: #'stable';
			project: 'Help System' with: '1.1'.
		spec 
			package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.2';
			package: 'Metacello-Help' with: 'Metacello-Help-dkh.11'. ].

	spec for: #'pharo' do: [
		spec project: 'ProfStef' with: #'stable'.
		spec 
			package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.10';
			package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-DaleHenrichs.1';
			package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.27'. ].

	spec for: #'pharo1.2.x' do: [
		spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2'. ].

	spec for: #'pharo1.3.x' do: [
		spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2'. ].

	spec for: #'squeak' do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.10'. ].
