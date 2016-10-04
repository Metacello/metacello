baseline
baseline: spec
  <baseline>
  spec for: #'common' do: [ spec
        package: 'Metacello-Base';
        package: 'Metacello-Core' with: [ spec
                requires: 'Metacello-Base';
                includes: #('Metacello-MC' 'Metacello-Platform') ];
        package: 'Metacello-MC' with: [ spec requires: #('Metacello-Core') ];
        package: 'Metacello-Cypress' with: [ spec requires: 'Metacello-MC' ];
        package: 'Metacello-Platform' with: [ spec requires: 'Metacello-Core' ];
        package: 'Metacello-TestsCore'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-TestsMCCore'
          with: [ spec requires: #('Metacello-MC' 'Metacello-TestsCore') ];
        yourself.
      spec
        group: 'default' with: #('batch');
        group: 'batch' with: #('Metacello-MC' 'Cypress');
        group: 'Base Configuration' with: #('Metacello-Base');
        group: 'Core' with: #('default');
        group: 'Cypress' with: #('Metacello-Cypress');
        group: 'Tests'
          with: #('batch' 'Metacello-TestsCore' 'Metacello-TestsMCCore');
        yourself ].
  spec for: #'gemstoneBase' do: [ spec
        package: 'Metacello-Base'
          with: [ spec includes: 'Metacello-GsCypress-Base' ];
        package: 'Metacello-Platform' with: [ spec
                file: 'Metacello-Platform.gscypress';
                postLoadDoIt: #'gemstone10beta311PostLoadDoIt' ];
        package: 'Metacello-GsCypress-Base'
          with: [ spec requires: 'Metacello-Base' ];
        package: 'Metacello-MC' with: [ spec
                includes: 'Metacello-GsCypress-MC';
                requires: #('Metacello-GsCypress-Platform') ];
        package: 'Metacello-GsCypress-MC'
          with: [ spec requires: 'Metacello-MC' ];
        package: 'Metacello-GsCypress-Platform'
          with: [ spec requires: 'Metacello-Platform' ];
        package: 'Metacello-TestsBaselineGsCypress'
          with: [ spec requires: #('Metacello-TestsMCCore') ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsBaselineGsCypress');
        yourself ].
  spec
    for: #(#'squeakCommon' #'gemstone')
    do: [ spec postLoadDoIt: #'reprimeRegistryIssue197'.
      spec baseline: 'FileTree'.
      spec
        project: 'Gofer' with: [ spec
                className: 'ConfigurationOfGofer';
                versionString: #'stable';
                loads: #('Core');
                repository: 'http://seaside.gemtalksystems.com/ss/metacello' ];
        project: 'Gofer Tests'
          copyFrom: 'Gofer'
          with: [ spec loads: #('Tests') ];
        yourself.
      spec
        package: 'Metacello-Base'
          with: [ spec includes: 'Metacello-Monticello-Base' ];
        package: 'Metacello-Monticello-Base'
          with: [ spec requires: 'Metacello-Base' ];
        package: 'Metacello-ToolBox'
          with: [ spec requires: #('Metacello-Base' 'Metacello-MC') ];
        package: 'Metacello-MC' with: [ spec
                includes: 'Metacello-Monticello-MC';
                requires: #('Metacello-Monticello-Platform') ];
        package: 'Metacello-FileTree'
          with: [ spec requires: #('Metacello-MC' 'FileTree') ];
        package: 'Metacello-GitBasedRepository'
          with: [ spec requires: #('Metacello-MC' 'Metacello-FileTree') ];
        package: 'Metacello-GitHub'
          with: [ spec requires: #('Metacello-GitBasedRepository') ];
        package: 'Metacello-Bitbucket'
          with: [ spec requires: #('Metacello-GitBasedRepository') ];
        package: 'Metacello-Monticello-MC'
          with: [ spec requires: #('Metacello-MC' 'Gofer') ];
        package: 'Metacello-Monticello-Platform'
          with: [ spec requires: 'Metacello-Platform' ];
        package: 'Metacello-Reference'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-Tutorial'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-TestsBaselineMonticello'
          with: [ spec requires: #('Metacello-TestsMCCore') ];
        package: 'Metacello-TestsMCCommon' with: [ spec
                requires:
                  #('Metacello-MC' 'Metacello-ToolBox' 'Metacello-GitHub' 'Metacello-Bitbucket' 'Metacello-TestsMCResources') ];
        package: 'Metacello-TestsMonticello'
          with: [ spec requires: #('Metacello-TestsMCCommon' 'Gofer Tests' 'Metacello-TestsCore') ];
        package: 'Metacello-TestsMonticelloB'
          with: [ spec requires: #('Metacello-TestsMCB' 'Metacello-TestsMonticello') ];
        package: 'Metacello-TestsMCA'
          with: [ spec requires: #('Metacello-TestsMCCommon' 'Metacello-TestsMCResources') ];
        package: 'Metacello-TestsMCB' with: [ spec
                requires:
                  #('Metacello-TestsMCCommon' 'Metacello-TestsMCResources' 'Metacello-TestsMonticello') ];
        package: 'Metacello-TestsCommonMC' with: [ spec
                file: 'Metacello-TestsCommonMC.common';
                requires: 'Metacello-TestsMCResources' ];
        package: 'Metacello-TestsReference'
          with: [ spec requires: #('Metacello-Reference') ];
        package: 'Metacello-TestsTutorial'
          with: [ spec requires: #('Metacello-Tutorial' 'Metacello-TestsMCResources') ];
        package: 'Metacello-TestsMCResources' with: [ spec
                postLoadDoIt: #'testResourcePostLoadDoIt';
                includes: #('Metacello-TestsCommonMC');
                requires: #('Metacello-MC') ];
        package: 'Metacello-TestsCypress'
          with: [ spec requires: #('Metacello-Cypress' 'Metacello-TestsMCB') ];
        yourself.
      spec
        group: 'default' with: #('Metacello-ToolBox');
        group: 'batch' with: #('Metacello-GitHub' 'Metacello-Bitbucket');
        group: 'Tutorial' with: #('Metacello-Tutorial' 'Metacello-Reference');
        group: 'UI' with: #('default');
        group: 'TravisCI_1'
          with:
            #('batch' 'Metacello-TestsCore' 'Metacello-TestsReference' 'Metacello-TestsMCCore');
        group: 'TravisCI_2' with: #('batch' 'Metacello-TestsMCA');
        group: 'TravisCI_3'
          with:
            #('batch' 'Metacello-TestsMCB' 'Metacello-TestsTutorial' 'Metacello-TestsCypress');
        group: 'TravisCI' with: #('TravisCI_1' 'TravisCI_2' 'TravisCI_3');
        group: 'Tests'
          with:
            #('Metacello-TestsTutorial' 'Metacello-TestsMCA' 'Metacello-TestsMCB' 'Metacello-TestsReference' 'Metacello-TestsCypress' 'Metacello-TestsMonticelloB' 'Metacello-TestsBaselineMonticello');
        yourself ].
  spec for: #'squeakCommon' do: [ spec
        configuration: 'HelpSystem' with: [ spec
                versionString: '1.1';
                loads: #('Core');
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        yourself.
      spec
        package: 'Metacello-TestsPlatform' with: [ spec
                requires: #('Metacello-Platform');
                file: 'Metacello-TestsPlatform.squeakCommon' ];
        package: 'Metacello-Help' with: [ spec requires: 'HelpSystem' ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsPlatform');
        group: 'TravisCI_1' with: #('Metacello-TestsPlatform');
        yourself ].
  spec for: #(#'pharo1.x' #'pharo2.x') do: [ spec
        project: 'ProfStef' with: [ spec
                className: 'ConfigurationOfProfStef';
                versionString: #'stable';
                repository:
                    'http://smalltalkhub.com/mc/PharoExtras/ProfStef/main' ];
        configuration: 'OSProcess' with: [ spec
                versionString: #'stable';
                repository: 'http://seaside.gemtalksystems.com/ss/metacello' ];
        yourself.
      spec
        package: 'Metacello-ProfStef'
          with: [ spec requires: #('Metacello-MC' 'ProfStef' 'Metacello-ToolBox') ];
        package: 'Metacello-TestsProfStef'
          with: [ spec requires: #('Metacello-ProfStef') ];
        package: 'Metacello-PharoCommonPlatform';
        package: 'Metacello-Platform'
          with: [ spec requires: #('Metacello-PharoCommonPlatform') ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsProfStef');
        group: 'Tutorial' with: #('Metacello-ProfStef');
        yourself ].
  spec for: #'pharo1.x' do: [ spec
        configuration: 'OSProcess'
          with: [ spec repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        package: 'Metacello-Platform' with: [ spec
                file: 'Metacello-Platform.pharo';
                requires: #('OSProcess') ] ].
  spec for: #'pharo1.1.x' do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.1/repository' ] ].
  spec for: #'pharo1.2.x' do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.1/repository' ] ].
  spec for: #'pharo1.3.x' do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.3/repository' ] ].
  spec for: #'pharo1.4.x' do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.4/repository' ] ].
  spec for: #'pharo2.x' do: [ spec
        configuration: 'OSProcess'
          with: [ spec repository: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20' ];
        yourself.
      spec
        package: 'Metacello-Platform' with: [ spec
                file: 'Metacello-Platform.pharo20';
                requires: #('OSProcess') ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself.
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo2.0/repository' ] ].
  spec for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x') do: [ spec
        package: 'Metacello-PharoCommonPlatform';
        package: 'Metacello-Platform' with: [ spec
                file: 'Metacello-Platform.pharo30';
                requires: #('Metacello-PharoCommonPlatform') ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself ].
  spec for: #(#'pharo3.x') do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo3.0/repository' ] ].
  spec for: #(#'pharo4.x') do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo4.0/repository' ] ].
  spec for: #(#'pharo5.x') do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo5.0/repository' ] ].
  spec for: #(#'pharo6.x') do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo6.0_dev/repository' ] ].
  spec for: #'squeak' do: [ spec
        baseline: 'FileTree'
          with: [ spec repository: 'github://dalehenrich/filetree:squeak4.3/repository' ];
        yourself.
      spec
        package: 'SqueakSSL-Core'
        with: [ spec repository: 'http://www.squeaksource.com/SqueakSSL' ].
      spec
        package: 'WebClient-Core'
        with: [ spec repository: 'http://ss3.gemstone.com/ss/WebClient' ].
      spec
        package: 'Metacello-Platform' with: [ spec
                file: 'Metacello-Platform.squeak';
                requires: #('WebClient-Core' 'SqueakSSL-Core') ];
        yourself ].
  spec for: #'gemstoneCommon' do: [  ].
  spec for: #'gemstone' do: [ spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:gemstone2.4/repository' ].
      spec
        package: 'Metacello-Platform' with: [ spec
                file: 'Metacello-Platform.gemstone';
                postLoadDoIt: #'gemstone10beta311PostLoadDoIt' ];
        package: 'Metacello-TestsPlatform' with: [ spec
                requires: #('Metacello-Platform');
                file: 'Metacello-TestsPlatform.gemstone' ];
        package: 'Metacello-GemStone-TestsMCB'
          with: [ spec requires: #('Metacello-TestsMCB') ];
        yourself.
      spec
        group: 'Tests'
          with: #('Metacello-TestsPlatform' 'Metacello-GemStone-TestsMCB');
        group: 'TravisCI_1' with: #('Metacello-TestsPlatform');
        group: 'TravisCI_3' with: #('Metacello-GemStone-TestsMCB');
        yourself ].
  spec for: #'gs2.x' do: [ spec
        package: 'Metacello-GS2x-Platform'
          with: [ spec requires: 'Metacello-Platform' ];
        package: 'Metacello-Platform'
          with: [ spec includes: 'Metacello-GS2x-Platform' ];
        yourself ].
  spec for: #'gs3.x' do: [ spec
        package: 'Metacello-GS3x-Platform'
          with: [ spec requires: 'Metacello-Platform' ];
        package: 'Metacello-Platform'
          with: [ spec includes: 'Metacello-GS3x-Platform' ];
        yourself ].
  spec for: #'gs3.4.x' do: [ spec
        package: 'Metacello-TestsBaselineGsCypress'
          with: [ spec requires: #('Metacello-TestsMCCore') ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsBaselineGsCypress');
        yourself ]