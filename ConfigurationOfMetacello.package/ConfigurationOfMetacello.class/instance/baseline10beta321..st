baselines
baseline10beta321: spec
  <version: '1.0-beta.32.1-baseline'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec repository: 'http://seaside.gemtalksystems.com/ss/metacello'.
      spec repository: 'http://smalltalkhub.com/mc/dkh/metacello/main'.
      spec
        project: 'FileTree'
          with: [ 
              spec
                className: 'ConfigurationOfFileTree';
                versionString: '1.0-baseline';
                repository: 'http://ss3.gemtalksystems.com/ss/FileTree' ];
        project: 'Gofer'
          with: [ 
              spec
                className: 'ConfigurationOfGofer';
                versionString: '1.0-baseline';
                loads: #('Core');
                repository: 'http://seaside.gemtalksystems.com/ss/metacello' ];
        project: 'Gofer Tests'
          copyFrom: 'Gofer'
          with: [ spec loads: #('Tests') ];
        yourself.
      spec
        package: 'Metacello-Base';
        package: 'Metacello-ToolBox'
          with: [ spec requires: #('Metacello-Base' 'Metacello-Core') ];
        package: 'Metacello-Core'
          with: [ 
              spec
                requires: 'Metacello-Base';
                includes: #('Metacello-MC' 'Metacello-Platform') ];
        package: 'Metacello-FileTree'
          with: [ spec requires: #('Metacello-MC' 'FileTree') ];
        package: 'Metacello-GitHub'
          with: [ spec requires: #('Metacello-MC' 'Metacello-FileTree') ];
        package: 'Metacello-MC'
          with: [ spec requires: #('Metacello-Core' 'Gofer') ];
        package: 'Metacello-Platform'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-Reference'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-Tutorial'
          with: [ spec requires: #('Metacello-Core') ];
        package: 'Metacello-TestsCore'
          with: [ spec requires: #('Metacello-Core') ];
        package: 'Metacello-TestsMC'
          with: [ 
              spec
                postLoadDoIt: #'testsMC10beta25PostLoadDoIt';
                includes: #('Metacello-TestsCommonMC');
                requires:
                    #('Metacello-MC' 'Metacello-TestsCore' 'Gofer Tests' 'Metacello-ToolBox' 'Metacello-GitHub') ];
        package: 'Metacello-TestsCommonMC'
          with: [ 
              spec
                file: 'Metacello-TestsCommonMC.common';
                requires: 'Metacello-TestsMC' ];
        package: 'Metacello-TestsReference'
          with: [ spec requires: #('Metacello-Reference') ];
        package: 'Metacello-TestsTutorial'
          with: [ spec requires: #('Metacello-Tutorial' 'Metacello-TestsMC') ];
        package: 'OB-Metacello'
          with: [ spec requires: #('Metacello-Platform' 'Metacello-Core' 'Metacello-ToolBox') ];
        yourself.
      spec
        group: 'default' with: #('batch' 'Metacello-ToolBox');
        group: 'batch' with: #('Metacello-Core' 'Metacello-GitHub');
        group: 'Base Configuration' with: #('Metacello-Base');
        group: 'Core' with: #('default');
        group: 'Tutorial' with: #('Metacello-Tutorial' 'Metacello-Reference');
        group: 'UI' with: #('default' 'OB-Metacello');
        group: 'TravisCI'
          with:
            #('Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC' 'Metacello-TestsReference');
        group: 'Tests'
          with:
            #('Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC' 'Metacello-TestsReference');
        yourself ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        project: 'HelpSystem'
          with: [ 
              spec
                className: 'ConfigurationOfHelpSystem';
                versionString: #'1.0-baseline';
                loads: #('Core');
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        project: 'OmniBrowser'
          with: [ 
              spec
                className: 'ConfigurationOfOmniBrowser';
                versionString: #'stable';
                loads: #('Core');
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        project: 'OSProcess'
          with: [ 
              spec
                className: 'ConfigurationOfOSProcess';
                versionString: #'stable';
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        yourself.
      spec
        package: 'Metacello-TestsPlatform'
          with: [ 
              spec
                requires: #('Metacello-Platform');
                file: 'Metacello-TestsPlatform.squeakCommon' ];
        package: 'Metacello-Help' with: [ spec requires: 'HelpSystem' ];
        package: 'OB-Metacello' with: [ spec requires: #('OmniBrowser') ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsPlatform');
        group: 'TravisCI' with: #('Metacello-TestsPlatform');
        yourself ].
  spec
    for: #'pharo'
    do: [ 
      spec
        project: 'ProfStef'
          with: [ 
              spec
                className: 'ConfigurationOfProfStef';
                versionString: #'stable';
                repository:
                    'http://smalltalkhub.com/mc/PharoExtras/ProfStef/main' ];
        project: 'OSProcess' with: [ spec versionString: #'stable' ];
        yourself.
      spec
        package: 'Metacello-ProfStef'
          with: [ spec requires: #('Metacello-Core' 'ProfStef' 'Metacello-ToolBox') ];
        package: 'Metacello-TestsProfStef'
          with: [ spec requires: #('Metacello-ProfStef') ];
        package: 'Metacello-PharoCommonPlatform'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-Platform'
          with: [ spec requires: #('Metacello-PharoCommonPlatform' 'OSProcess') ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsProfStef');
        group: 'Tutorial' with: #('Metacello-ProfStef');
        yourself ].
  spec
    for: #'pharo1.x'
    do: [ 
      spec
        package: 'Metacello-Platform'
        with: [ spec file: 'Metacello-Platform.pharo' ] ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec removeProject: 'OmniBrowser'.
      spec
        project: 'OSProcess'
          with: [ spec repository: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20' ];
        yourself.
      spec
        package: 'Metacello-Platform'
          with: [ spec file: 'Metacello-Platform.pharo20' ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself ].
  spec
    for: #'pharo3.x'
    do: [ 
      spec removeProject: 'OmniBrowser'.
      spec
        project: 'OSProcess'
          with: [ spec repository: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20' ];
        yourself.
      spec
        package: 'Metacello-Platform'
          with: [ spec file: 'Metacello-Platform.pharo30' ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself ].
  spec
    for: #'squeak'
    do: [ 
      spec yourself.
      spec
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.squeak';
                requires: #('OSProcess') ];
        package: 'Metacello-TestsMC'
          with: [ 
              spec
                preLoadDoIt: #'preLoadSqueakEnsureGlobalUnderscoreSelectors';
                postLoadDoIt: #'postLoadSqueakRestoreGlobalUnderscoreSelectors' ];
        package: 'Metacello-TestsTutorial'
          with: [ 
              spec
                preLoadDoIt: #'preLoadSqueakEnsureGlobalUnderscoreSelectors';
                postLoadDoIt: #'postLoadSqueakRestoreGlobalUnderscoreSelectors' ];
        yourself ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        project: 'GsCore'
          with: [ 
              spec
                className: 'ConfigurationOfGsCore';
                versionString: '0.247';
                repository:
                    'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
        project: 'GsMonticello'
          with: [ 
              spec
                className: 'ConfigurationOfGsMonticello';
                versionString: '0.242';
                repository:
                    'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
        project: 'OmniBrowser'
          with: [ 
              spec
                className: 'ConfigurationOfGsOB';
                versionString: #'stable';
                repository:
                    'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
        yourself.
      spec
        package: 'Metacello-GitHub' with: [ spec requires: #('GsCore') ];
        package: 'Metacello-MC'
          with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.gemstone';
                postLoadDoIt: #'gemstone10beta311PostLoadDoIt';
                requires: 'GsMonticello' ];
        package: 'Metacello-TestsPlatform'
          with: [ 
              spec
                requires: #('Metacello-Platform');
                file: 'Metacello-TestsPlatform.gemstone' ];
        package: 'OB-Metacello' with: [ spec requires: #('OmniBrowser') ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsPlatform');
        group: 'TravisCI' with: #('Metacello-TestsPlatform');
        yourself ]