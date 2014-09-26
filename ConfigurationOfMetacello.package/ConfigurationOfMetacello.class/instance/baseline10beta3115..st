baselines
baseline10beta3115: spec
  <version: '1.0-beta.31.1.5-baseline'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec repository: 'http://seaside.gemtalksystems.com/ss/metacello'.
      spec
        project: 'Gofer Core'
          with: [ 
              spec
                className: 'ConfigurationOfGofer';
                versionString: '1.0-baseline';
                loads: #('Core');
                file: 'ConfigurationOfGofer';
                repository: 'http://seaside.gemtalksystems.com/ss/metacello' ];
        project: 'Gofer Tests'
          copyFrom: 'Gofer Core'
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
        package: 'Metacello-MC'
          with: [ spec requires: #('Metacello-Core' 'Gofer Core') ];
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
                requires: #('Metacello-ToolBox' 'Metacello-MC' 'Gofer Tests') ];
        package: 'Metacello-TestsReference'
          with: [ spec requires: #('Metacello-Reference') ];
        package: 'Metacello-TestsTutorial'
          with: [ spec requires: #('Metacello-Tutorial' 'Metacello-TestsMC') ];
        package: 'OB-Metacello'
          with: [ spec requires: #('Metacello-Platform' 'Metacello-Core' 'Metacello-ToolBox') ];
        yourself.
      spec
        group: 'default' with: #('Metacello-Core' 'Metacello-ToolBox');
        group: 'batch' with: #('Metacello-Core');
        group: 'Base Configuration' with: #('Metacello-Base');
        group: 'Core' with: #('default');
        group: 'Tutorial' with: #('Metacello-Tutorial' 'Metacello-Reference');
        group: 'UI' with: #('OB-Metacello');
        group: 'TravisCI'
          with:
            #('Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC' 'Metacello-TestsReference');
        group: 'Tests'
          with:
            #('default' 'Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC' 'Metacello-TestsReference');
        yourself ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        project: 'Help System'
          with: [ 
              spec
                className: 'ConfigurationOfHelpSystem';
                versionString: '1.0-baseline';
                loads: #('Core');
                file: 'ConfigurationOfHelpSystem';
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        project: 'OB'
          with: [ 
              spec
                className: 'ConfigurationOfOmniBrowser';
                versionString: '1.1-baseline';
                loads: #('Core');
                file: 'ConfigurationOfOmniBrowser';
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        yourself.
      spec
        package: 'Metacello-TestsPlatform'
          with: [ 
              spec
                requires: #('Metacello-Platform');
                file: 'Metacello-TestsPlatform.squeakCommon' ];
        package: 'Metacello-Help' with: [ spec requires: 'Help System' ];
        package: 'OB-Metacello' with: [ spec requires: #('OB') ];
        yourself.
      spec
        group: 'default' with: #('Metacello-Help');
        group: 'TravisCI' with: #('Metacello-TestsPlatform');
        group: 'Tests' with: #('Metacello-TestsPlatform');
        yourself ].
  spec
    for: #'pharo'
    do: [ 
      spec
        project: 'ProfStef'
          with: [ 
              spec
                className: 'ConfigurationOfProfStef';
                versionString: '1.0-baseline';
                file: 'ConfigurationOfProfStef';
                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
        yourself.
      spec
        package: 'Metacello-ProfStef'
          with: [ spec requires: #('Metacello-Core' 'ProfStef' 'Metacello-ToolBox') ];
        package: 'Metacello-TestsProfStef'
          with: [ spec requires: #('Metacello-ProfStef') ];
        package: 'Metacello-Platform' with: 'Metacello-Platform.pharo';
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsProfStef');
        group: 'Tutorial' with: #('Metacello-ProfStef');
        yourself ].
  spec
    for: #'pharo1.0.x'
    do: [ 
      spec
        package: 'Metacello-ProfStef'
        with: [ spec file: 'Metacello-ProfStef.toolset' ] ].
  spec
    for: #'pharo1.1.x'
    do: [ 
      spec
        package: 'Metacello-ProfStef'
        with: [ spec file: 'Metacello-ProfStef.toolset' ] ].
  spec
    for: #'pharo1.2.x'
    do: [ 
      spec
        package: 'Metacello-ProfStef'
          with: [ spec file: 'Metacello-ProfStef.toolset' ];
        package: 'Metacello-TestsMC'
          with: [ spec includes: #('Metacello-Issue3758') ];
        package: 'Metacello-Issue3758'
          with: [ spec requires: #('Metacello-TestsMC') ];
        yourself ].
  spec
    for: #'pharo1.3.x'
    do: [ 
      spec
        package: 'Metacello-TestsMC'
          with: [ spec includes: #('Metacello-Issue3758') ];
        package: 'Metacello-Issue3758'
          with: [ spec requires: #('Metacello-TestsMC') ];
        yourself ].
  spec
    for: #'pharo2.x'
    do: [ 
      spec
        package: 'Metacello-Platform' with: 'Metacello-Platform.pharo20';
        yourself ].
  spec
    for: #'squeak'
    do: [ 
      spec
        package: 'Metacello-Platform' with: 'Metacello-Platform.squeak';
        yourself ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        project: 'Monticello'
          with: [ 
              spec
                className: 'ConfigurationOfGsMonticello';
                repository:
                    'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
        project: 'OB'
          with: [ 
              spec
                className: 'ConfigurationOfGsOB';
                repository:
                    'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
        yourself.
      spec
        package: 'Metacello-Platform'
          with: [ 
              spec
                file: 'Metacello-Platform.gemstone';
                postLoadDoIt: #'gemstone10beta311PostLoadDoIt';
                requires: 'Monticello' ];
        package: 'Metacello-TestsPlatform'
          with: [ 
              spec
                requires: #('Metacello-Platform');
                file: 'Metacello-TestsPlatform.gemstone' ];
        package: 'OB-Metacello' with: [ spec requires: #('OB') ];
        yourself.
      spec
        group: 'Tests' with: #('Metacello-TestsPlatform');
        group: 'TravisCI' with: #('Metacello-TestsPlatform');
        yourself ]