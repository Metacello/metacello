versions
version10beta19: spec
	<excludedValidationIssues: #('1.0-beta.19' #(noVersionSpecified))>
	<version: '1.0-beta.19' imports: #('1.0-beta.19-baseline' )>

	spec for: #common do: [
		spec blessing: #beta.
		spec description: '- "Pure" Refactoring of MetacelloVersionConstructor>>on: (Danie Roux)
- fix Issue 7: http://code.google.com/p/metacello/issues/detail?id=7 "#repositoryOverrides: should be in MetacelloMCVersion"
- fix Issue 13: http://code.google.com/p/metacello/issues/detail?id=13 "more than one repository per package"
- fix Issue 16: http://code.google.com/p/metacello/issues/detail?id=16 "version level predoit/postdoit"
- fix Issue 20: http://code.google.com/p/metacello/issues/detail?id=20 "validation in #postLoadDoIt:/#preLoadDoit:"
- fix Issue 28: http://code.google.com/p/metacello/issues/detail?id=28 "supplyingAnswers: attribute for packages"
- fix Issue 30: http://code.google.com/p/metacello/issues/detail?id=30 "Imported version names"
- fix Issue 33: http://code.google.com/p/metacello/issues/detail?id=33 "ensureMetacello should do full bootstrap"
- fix Issue 38: http://code.google.com/p/metacello/issues/detail?id=38 "Metacello load fails on Squeak"
- port Gofer-lr.109 to GemStone
- stop caching packages in Pharo ... can cause trouble if repository off-line
- fix problems with GemStone Metacello when runnng without OB
- make error handler for #do:displaying: a little more specific 
- fix a problem when a second version of a package is being requested during atomic load. Must override with newer package.
- run with pre and post 10504 Pharo images
'.
		spec author: 'dkh'.
		spec timestamp: '1/8/2010 11:12'.
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
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.10'.].
	spec for: #squeak do: [
		spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.4'.].