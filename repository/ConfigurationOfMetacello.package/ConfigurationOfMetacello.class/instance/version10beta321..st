versions
version10beta321: spec
  <version: '1.0-beta.32.1' imports: #('1.0-beta.32.1-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec
        description:
          '- add squeak4.5.x as platform attribute
- minor hack to get Metacello Preview to bootstrap (again) on Squeak4.4 and Squeak4.5
1.0-beta.32.1 (dkh.758):
- Issue #65: port to Pharo-2.0
  https://github.com/dalehenrich/metacello-work/issues/65
1.0-beta.32.1 (dkh.762):
- adjust dependencies for tests
- fix tests when loaded from mcz files
1.0-beta.32.1 (dkh.764):
- switch to using http://smalltalkhub.com/mc/dkh/metacello/main as alternate repository to http://seaside.gemstone.com/ss/metacello
- fix Issue #151: travis builds hanging for Squeak-4.4 and Squeak4.5
  https://github.com/dalehenrich/metacello-work/issues/151
1.0-beta.32.1 (dkh.765):
- workaround for SmalltalkHub Issue 21: corrupted package .... Metacello-Reference.dkh.35
  https://code.google.com/p/smalltalk-hub/issues/detail?id=21
1.0-beta.32.1 (dkh.767):
- workaround for SmalltalkHub Issue 21: corrupted package .... Metacello-TestsPlatform.squeakCommon-dkh.9
- bootstrap from Metacello-Base needs to load Metacello-PharoCommonPlatform
1.0-beta.32.1 (dkh.774):
- fix Issue #172: Metacello-Base bootstrap code and configurations should reference seaside.gemtalksystems.com repos
  https://github.com/dalehenrich/metacello-work/issues/172
1.0-beta.32.1 (dkh.780):
- pick up latest package versions from git repo ... preparing for release
1.0-beta.32.1 (dkh.781):
- fix Issue #170: location of ConfigurationOfOsProcess for Pharo2.0+ changed
  https://github.com/dalehenrich/metacello-work/issues/170
1.0-beta.32.1 (dkh.782):
- split tests into two groups to avoid travis-ci 30 minute limit
- fix google Issue 184: github zip download failures due to filesystem issues
  https://code.google.com/p/metacello/issues/detail?id=184
- fix Issue #175: MCGitHubRepository and cache
  https://github.com/dalehenrich/metacello-work/issues/175
- fix Issue #174: `lock` should work with symbolic versions
  https://github.com/dalehenrich/metacello-work/issues/174
- fix Issue #176: attempt to modify immutable project spec
  https://github.com/dalehenrich/metacello-work/issues/176
- fix Issue #181: The case for `unconditional` baseline loading
  https://github.com/dalehenrich/metacello-work/issues/181'.
      spec postLoadDoIt: #'metacelloPrimeRegistry'.
      spec author: 'dkh'.
      spec timestamp: '7/17/2013 08:18'.
      spec
        project: 'FileTree' with: #'stable';
        project: 'Gofer' with: #'stable';
        project: 'Gofer Tests' with: #'stable'.
      spec
        package: 'Metacello-Base' with: 'Metacello-Base-dkh.109';
        package: 'Metacello-Core' with: 'Metacello-Core-dkh.694';
        package: 'Metacello-FileTree' with: 'Metacello-FileTree-dkh.29';
        package: 'Metacello-GitHub' with: 'Metacello-GitHub-dkh.29';
        package: 'Metacello-MC' with: 'Metacello-MC-dkh.680';
        package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.36';
        package: 'Metacello-TestsCommonMC'
          with: 'Metacello-TestsCommonMC.common-dkh.3';
        package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.35';
        package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.387';
        package: 'Metacello-TestsMCA' with: 'Metacello-TestsMCA-dkh.7';
        package: 'Metacello-TestsMCB' with: 'Metacello-TestsMCB-dkh.13';
        package: 'Metacello-TestsMCCore' with: 'Metacello-TestsMCCore-dkh.5';
        package: 'Metacello-TestsMCResources'
          with: 'Metacello-TestsMCResources-dkh.4';
        package: 'Metacello-TestsReference'
          with: 'Metacello-TestsReference-dkh.20';
        package: 'Metacello-TestsTutorial'
          with: 'Metacello-TestsTutorial-ChristopheDemarey.41';
        package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.134';
        package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.26' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        project: 'OSProcess' with: '4.4.5';
        project: 'HelpSystem' with: '1.1'.
      spec
        package: 'Metacello-TestsPlatform'
          with: 'Metacello-TestsPlatform.squeakCommon-dkh.11';
        package: 'Metacello-Help' with: 'Metacello-Help-dkh.12' ].
  spec
    for: #'pharo'
    do: [ 
      spec
        project: 'ProfStef' with: #'stable';
        project: 'OSProcess' with: #'stable'.
      spec
        package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-dkh.13';
        package: 'Metacello-TestsProfStef'
          with: 'Metacello-TestsProfStef-ChristopheDemarey.5';
        package: 'Metacello-PharoCommonPlatform'
          with: 'Metacello-PharoCommonPlatform-dkh.3' ].
  spec
    for: #'pharo1.x'
    do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.34' ].
  spec
    for: #'pharo1.2.x'
    do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
  spec
    for: #'pharo1.3.x'
    do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        package: 'Metacello-Platform' with: 'Metacello-Platform.pharo20-dkh.40';
        package: 'Metacello-TestsCommonMC'
          with: 'Metacello-TestsCommonMC.pharo20-dkh.3' ].
  spec
    for: #'pharo3.x'
    do: [ 
      spec
        package: 'Metacello-Platform'
          with: 'Metacello-Platform.pharo30-ChristopheDemarey.2';
        package: 'Metacello-TestsCommonMC'
          with: 'Metacello-TestsCommonMC.pharo20-dkh.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.23' ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        project: 'GsCore' with: '0.247';
        project: 'GsMonticello' with: '0.244.2'.
      spec
        package: 'Metacello-MC'
          with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
        package: 'Metacello-TestsPlatform'
          with: 'Metacello-TestsPlatform.gemstone-.6';
        package: 'Metacello-Platform'
          with: 'Metacello-Platform.gemstone-dkh.32' ]