baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                baseline: 'FileTree';
                project: 'Gofer'
                    with: [ 
                            spec
                                className: 'ConfigurationOfGofer';
                                versionString: #'stable';
                                loads: #('Core');
                                repository: 'http://seaside.gemstone.com/ss/metacello' ];
                project: 'Gofer Tests' copyFrom: 'Gofer' with: [ spec loads: #('Tests') ];
                yourself.
            spec
                package: 'Metacello-Base';
                package: 'Metacello-ToolBox' with: [ spec requires: #('Metacello-Base' 'Metacello-Core') ];
                package: 'Metacello-Core'
                    with: [ 
                            spec
                                requires: 'Metacello-Base';
                                includes: #('Metacello-MC' 'Metacello-Platform') ];
                package: 'Metacello-FileTree' with: [ spec requires: #('Metacello-MC' 'FileTree') ];
                package: 'Metacello-GitHub' with: [ spec requires: #('Metacello-MC' 'Metacello-FileTree') ];
                package: 'Metacello-MC' with: [ spec requires: #('Metacello-Core' 'Gofer') ];
                package: 'Metacello-Platform' with: [ spec requires: #('Metacello-MC') ];
                package: 'Metacello-Reference' with: [ spec requires: #('Metacello-MC') ];
                package: 'Metacello-Tutorial' with: [ spec requires: #('Metacello-Core') ];
                package: 'Metacello-TestsCore' with: [ spec requires: #('Metacello-Core') ];
                package: 'Metacello-TestsMC'
                    with: [ 
                            spec
                                postLoadDoIt: #'testResourcePostLoadDoIt';
                                requires: #('Metacello-MC' 'Metacello-TestsCore' 'Gofer Tests' 'Metacello-ToolBox') ];
                package: 'Metacello-TestsReference' with: [ spec requires: #('Metacello-Reference') ];
                package: 'Metacello-TestsTutorial' with: [ spec requires: #('Metacello-Tutorial' 'Metacello-TestsMC') ];
                package: 'OB-Metacello'
                    with: [ spec requires: #('Metacello-Platform' 'Metacello-Core' 'Metacello-ToolBox') ];
                yourself.
            spec
                group: 'default' with: #('Metacello-Core' 'Metacello-ToolBox' 'Metacello-GitHub');
                group: 'batch' with: #('Metacello-Core' 'Metacello-GitHub');
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
                project: 'HelpSystem'
                    with: [ 
                            spec
                                className: 'ConfigurationOfHelpSystem';
                                versionString: '1.1';
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
                                versionString: '4.4.5';
                                repository: 'http://www.squeaksource.com/MetacelloRepository';
                                repository: 'http://seaside.gemstone.com/ss/metacello' ];
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
                                repository: 'http://www.squeaksource.com/MetacelloRepository' ];
                yourself.
            spec
                package: 'Metacello-ProfStef'
                    with: [ spec requires: #('Metacello-Core' 'ProfStef' 'Metacello-ToolBox') ];
                package: 'Metacello-TestsProfStef' with: [ spec requires: #('Metacello-ProfStef') ];
                package: 'Metacello-Platform'
                    with: [ 
                            spec
                                file: 'Metacello-Platform.pharo';
                                requires: #('OSProcess') ];
                yourself.
            spec
                group: 'Tests' with: #('Metacello-TestsProfStef');
                group: 'Tutorial' with: #('Metacello-ProfStef');
                yourself ].
    spec
        for: #'pharo1.1.x'
        do: [ spec baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:pharo1.1/repository' ] ].
    spec
        for: #'pharo1.2.x'
        do: [ spec baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:pharo1.1/repository' ] ].
    spec
        for: #'pharo1.3.x'
        do: [ spec baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:pharo1.3/repository' ] ].
    spec
        for: #'pharo1.4.x'
        do: [ spec baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:pharo1.4/repository' ] ].
    spec
        for: #'pharo2.x'
        do: [ 
            spec
                package: 'Metacello-Platform'
                with: [ 
                    spec
                        file: 'Metacello-Platform.pharo20';
                        requires: #('OSProcess') ].
            spec baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:pharo2.0/repository' ] ].
    spec
        for: #'squeak'
        do: [ 
            spec
                baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:squeak4.3/repository' ];
                yourself.
            spec
                package: 'Metacello-Platform'
                    with: [ 
                            spec
                                file: 'Metacello-Platform.squeak';
                                requires: #('OSProcess') ];
                yourself ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                baseline: 'FileTree' with: [ spec repository: 'github://dalehenrich/filetree:gemstone2.4/repository' ];
                project: 'GsCore'
                    with: [ 
                            spec
                                className: 'ConfigurationOfGsCore';
                                versionString: '0.247';
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
                project: 'GsMonticello'
                    with: [ 
                            spec
                                className: 'ConfigurationOfGsMonticello';
                                versionString: '0.242';
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
                project: 'OmniBrowser'
                    with: [ 
                            spec
                                className: 'ConfigurationOfGsOB';
                                versionString: #'stable';
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
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
                package: 'OB-Metacello' with: [ spec requires: #('OmniBrowser') ];
                yourself.
            spec
                group: 'Tests' with: #('Metacello-TestsPlatform');
                group: 'TravisCI' with: #('Metacello-TestsPlatform');
                yourself ]