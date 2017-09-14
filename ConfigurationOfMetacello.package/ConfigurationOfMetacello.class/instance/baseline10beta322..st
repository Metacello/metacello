baselines
baseline10beta322: spec
  <version: '1.0-beta.32.2-baseline'>
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
        package: 'Metacello-TestsMCResources'
          with: [ 
              spec
                postLoadDoIt: #'testResourcePostLoadDoIt';
                includes: #('Metacello-TestsCommonMC');
                requires: #('Metacello-Core') ];
        package: 'Metacello-TestsMCCore'
          with: [ 
              spec
                requires:
                  #('Metacello-Core' 'Metacello-TestsCore' 'Metacello-ToolBox' 'Metacello-TestsMCResources') ];
        package: 'Metacello-TestsMC'
          with: [ 
              spec
                requires:
                  #('Metacello-MC' 'Gofer Tests' 'Metacello-ToolBox' 'Metacello-GitHub' 'Metacello-TestsMCResources') ];
        package: 'Metacello-TestsMCA'
          with: [ spec requires: #('Metacello-TestsMC') ];
        package: 'Metacello-TestsMCB'
          with: [ spec requires: #('Metacello-TestsMC') ];
        package: 'Metacello-TestsCommonMC'
          with: [ 
              spec
                file: 'Metacello-TestsCommonMC.common';
                requires: 'Metacello-TestsMCResources' ];
        package: 'Metacello-TestsReference'
          with: [ spec requires: #('Metacello-Reference') ];
        package: 'Metacello-TestsTutorial'
          with: [ spec requires: #('Metacello-Tutorial' 'Metacello-TestsMCResources') ];
        yourself.
      spec
        group: 'default' with: #('batch' 'Metacello-ToolBox');
        group: 'batch' with: #('Metacello-Core' 'Metacello-GitHub');
        group: 'Base Configuration' with: #('Metacello-Base');
        group: 'Core' with: #('default');
        group: 'Tutorial' with: #('Metacello-Tutorial' 'Metacello-Reference');
        group: 'UI' with: #('default');
        group: 'TravisCI_1'
          with:
            #('Metacello-TestsCore' 'Metacello-TestsReference' 'Metacello-TestsMCCore');
        group: 'TravisCI_2' with: #('Metacello-TestsMCA');
        group: 'TravisCI_3'
          with: #('Metacello-TestsMCB' 'Metacello-TestsTutorial');
        group: 'TravisCI' with: #('TravisCI_1' 'TravisCI_2' 'TravisCI_3');
        group: 'Tests'
          with:
            #('Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMCA' 'Metacello-TestsMCB' 'Metacello-TestsReference' 'Metacello-TestsMCCore');
        yourself ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        project: 'HelpSystem'
          with: [ 
              spec
                className: 'ConfigurationOfHelpSystem';
                versionString: '1.0-baseline';
                loads: #('Core');
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        project: 'OSProcess'
          with: [ 
              spec
                className: 'ConfigurationOfOSProcess';
                versionString: #'stable';
                repository: 'http://www.squeaksource.com/MetacelloRepository';
                repository: 'http://seaside.gemtalksystems.com/ss/metacello' ];
        yourself.
      spec
        package: 'Metacello-TestsPlatform'
          with: [ 
              spec
                requires: #('Metacello-Platform');
                file: 'Metacello-TestsPlatform.squeakCommon' ];
        package: 'Metacello-Help' with: [ spec requires: 'HelpSystem' ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsPlatform');
        group: 'TravisCI_1' with: #('Metacello-TestsPlatform');
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
        yourself.
      spec
        package: 'Metacello-ProfStef'
          with: [ spec requires: #('Metacello-Core' 'ProfStef' 'Metacello-ToolBox') ];
        package: 'Metacello-TestsProfStef'
          with: [ spec requires: #('Metacello-ProfStef') ];
        package: 'Metacello-PharoCommonPlatform'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-Platform'
          with: [ spec requires: #('Metacello-PharoCommonPlatform') ];
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
        with: [ spec 
				file: 'Metacello-Platform.pharo';
				 requires: #('OSProcess') ] ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        project: 'OSProcess'
          with: [ spec repository: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20' ];
        yourself.
      spec
        package: 'Metacello-Platform'
          with: [ spec
				file: 'Metacello-Platform.pharo20';
				requires: #('OSProcess') ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself ].
  spec
    for: #'pharo3.x'
    do: [ 
      spec removeProject: 'OSProcess'.
      spec
        package: 'Metacello-Platform'
          with: [ spec
				file: 'Metacello-Platform.pharo30' ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself ].
  spec
    for: #'squeak'
    do: [
      spec
        package: 'SqueakSSL-Core'
        with: [spec repository: 'http://www.squeaksource.com/SqueakSSL'].
      spec
        package: 'WebClient-Core'
        with: [spec repository: 'http://ss3.gemstone.com/ss/WebClient'].
      spec
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.squeak';
                repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/SwaUtilities';
                requires: #('WebClient-Core' 'SqueakSSL-Core') ];
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
        yourself.
      spec
        package: 'Metacello-GitHub' with: [ spec requires: #('GsCore') ];
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
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsPlatform');
        group: 'TravisCI_1' with: #('Metacello-TestsPlatform');
        yourself ]