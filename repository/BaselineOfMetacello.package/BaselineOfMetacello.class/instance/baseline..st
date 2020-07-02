baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec postLoadDoIt: #'reprimeRegistryIssue197'.
      spec
        package: 'Metacello-Base';
        package: 'Metacello-ToolBox'
          with: [ spec requires: #('Metacello-Base' 'Metacello-Core') ];
        package: 'Metacello-Core'
          with: [ 
              spec
                requires: 'Metacello-Base';
                includes: #('Metacello-MC' 'Metacello-Platform') ];
        package: 'Metacello-Cypress' with: [ spec requires: 'Metacello-Core' ];
        package: 'Metacello-FileTree'
          with: [ spec requires: #('Metacello-MC' 'FileTree') ];
        package: 'Metacello-GitBasedRepository'
          with: [ spec requires: #('Metacello-MC' 'Metacello-FileTree') ];
        package: 'Metacello-GitHub'
          with: [ spec requires: #('Metacello-GitBasedRepository') ];
        package: 'Metacello-Bitbucket'
          with: [ spec requires: #('Metacello-GitBasedRepository') ];
        package: 'Metacello-MC' with: [ spec requires: #('Metacello-Core') ];
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
                  #('Metacello-MC' 'Metacello-ToolBox' 'Metacello-GitHub' 'Metacello-Bitbucket' 'Metacello-TestsMCResources') ];
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
        package: 'Metacello-TestsCypress'
          with: [ spec requires: #('Metacello-Cypress' 'Metacello-TestsMCB') ];
        yourself.
      spec
        group: 'default' with: #('batch' 'Metacello-ToolBox');
        group: 'batch'
          with:
            #('Metacello-Core' 'Metacello-GitHub' 'Metacello-Bitbucket' 'Cypress');
        group: 'Base Configuration' with: #('Metacello-Base');
        group: 'Core' with: #('default');
        group: 'Cypress' with: #('Metacello-Cypress');
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
            #('batch' 'Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMCA' 'Metacello-TestsMCB' 'Metacello-TestsReference' 'Metacello-TestsMCCore' 'Metacello-TestsCypress');
        yourself ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        configuration: 'HelpSystem'
          with: [ 
              spec
                versionString: '1.1';
                loads: #('Core');
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
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
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ 
      self filetree: spec.
      self gofer: spec.
      spec
        project: 'ProfStef'
          with: [ 
              spec
                className: 'ConfigurationOfProfStef';
                versionString: #'stable';
                repository:
                    'http://smalltalkhub.com/mc/PharoExtras/ProfStef/main' ];
        configuration: 'OSProcess'
          with: [ 
              spec
                versionString: #'stable';
                repository: 'http://seaside.gemtalksystems.com/ss/metacello' ];
        yourself.
      spec
        package: 'Metacello-MC' with: [ spec requires: #('Gofer') ];
        package: 'Metacello-TestsMC' with: [ spec requires: #('Gofer Tests') ];
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
        configuration: 'OSProcess'
          with: [ spec repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.pharo';
                requires: #('OSProcess') ] ].
  spec
    for: #'pharo1.1.x'
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.1/repository' ] ].
  spec
    for: #'pharo1.2.x'
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.1/repository' ] ].
  spec
    for: #'pharo1.3.x'
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.3/repository' ] ].
  spec
    for: #'pharo1.4.x'
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo1.4/repository' ] ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        configuration: 'OSProcess'
          with: [ spec repository: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20' ];
        yourself.
      spec
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.pharo20';
                requires: #('OSProcess') ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself.
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo2.0/repository' ] ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
    do: [ 
      self filetree: spec.
      self gofer: spec.
      spec
        package: 'Metacello-MC' with: [ spec requires: #('Gofer') ];
        package: 'Metacello-TestsMC' with: [ spec requires: #('Gofer Tests') ];
        package: 'Metacello-PharoCommonPlatform'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.pharo30';
                requires: #('Metacello-PharoCommonPlatform') ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself ].
  spec
    for: #(#'pharo6.x' #'pharo7.x')
    do: [ 
      spec
        package: 'Metacello-MC' with: [ spec requires: #('Metacello-Core') ];
        package: 'Metacello-TestsMC'
          with: [ 
              spec
                requires:
                  #('Metacello-MC' 'Metacello-ToolBox' 'Metacello-GitHub' 'Metacello-Bitbucket' 'Metacello-TestsMCResources') ];
        package: 'Metacello-PharoCommonPlatform'
          with: [ spec requires: #('Metacello-MC') ];
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.pharo60';
                requires: #('Metacello-PharoCommonPlatform') ];
        package: 'Metacello-TestsCommonMC'
          with: [ spec file: 'Metacello-TestsCommonMC.pharo20' ];
        yourself ].
  spec
    for: #(#'pharo3.x')
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo3.0/repository' ] ].
  spec
    for: #(#'pharo4.x')
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo4.0/repository' ] ].
  spec
    for: #(#'pharo5.x')
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo5.0/repository' ] ].
  spec
    for: #(#'pharo6.x')
    do: [ 
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:pharo6.0_dev/repository' ] ].
  spec
    for: #'squeak'
    do: [ 
      self filetree: spec.
      self gofer: spec.
      spec
        baseline: 'FileTree'
          with: [ spec repository: 'github://dalehenrich/filetree:squeak4.3/repository' ];
        yourself.
      spec
        package: 'Metacello-MC' with: [ spec requires: #('Gofer') ];
        package: 'Metacello-TestsMC' with: [ spec requires: #('Gofer Tests') ];
        package: 'Metacello-Platform'
          with: [ spec file: 'Metacello-Platform.squeak' ];
        yourself ].
  spec
    for:
      #(#'squeak4.1.x' #'squeak4.2.x' #'squeak4.3.x' #'squeak4.4.x' #'squeak4.5.x')
    do: [ 
      spec
        configuration: 'WebClient'
        with: [ 
          spec
            loads: #('Core');
            repository: 'http://www.squeaksource.com/MetacelloRepository';
            repository: 'http://ss3.gemtalksystems.com/ss/WebClient' ].
      spec
        package: 'SqueakSSL-Core'
          with: [ spec repository: 'http://www.squeaksource.com/SqueakSSL' ];
        package: 'Metacello-Platform'
          with: [ spec requires: #('WebClient' 'SqueakSSL-Core') ];
        yourself ].
  spec
    for: #'gemstone'
    do: [ 
      self filetree: spec.
      self gofer: spec.
      spec
        baseline: 'FileTree'
        with: [ spec repository: 'github://dalehenrich/filetree:gemstone2.4/repository' ].
      spec
        package: 'Metacello-MC' with: [ spec requires: #('Gofer') ];
        package: 'Metacello-TestsMC' with: [ spec requires: #('Gofer Tests') ];
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.gemstone';
                postLoadDoIt: #'gemstone10beta311PostLoadDoIt' ];
        package: 'Metacello-TestsPlatform'
          with: [ 
              spec
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
  spec
    for: #'gs2.x'
    do: [ 
      spec
        package: 'Metacello-GS2x-Platform'
          with: [ spec requires: 'Metacello-Platform' ];
        package: 'Metacello-Platform'
          with: [ spec includes: 'Metacello-GS2x-Platform' ];
        yourself ].
  spec
    for: #'gs3.x'
    do: [ 
      spec
        package: 'Metacello-GS3x-Platform'
          with: [ spec requires: 'Metacello-Platform' ];
        package: 'Metacello-Platform'
          with: [ spec includes: 'Metacello-GS3x-Platform' ];
        yourself ].
  spec
    for: #'gs3.3.x'
    do: [ 
      spec
        package: 'Metacello-Platform'
          with: [ spec includes: #('Metacello-GS3x-Platform' 'Metacello-Platform3x') ];
        package: 'Metacello-Platform3x'
          with: [ 
              spec
                requires: 'Metacello-Platform';
                postLoadDoIt: #'gemstoneMetacelloGemStonePlatform3xInit' ];
        yourself ]