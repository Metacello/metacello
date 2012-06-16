baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                project: 'FileTree'
                    with: [ 
                            spec
                                className: 'ConfigurationOfFileTree';
                                versionString: '1.0';
                                repository: 'http://ss3.gemstone.com/ss/FileTree' ];
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
                    with: [ spec requires: #('Metacello-MC' 'Metacello-TestsCore' 'Gofer Tests' 'Metacello-ToolBox')	"postLoadDoIt: #'testsMC10beta25PostLoadDoIt';" ];
                package: 'Metacello-TestsReference' with: [ spec requires: #('Metacello-Reference') ];
                package: 'Metacello-TestsTutorial' with: [ spec requires: #('Metacello-Tutorial' 'Metacello-TestsMC') ];
                package: 'OB-Metacello'
                    with: [ spec requires: #('Metacello-Platform' 'Metacello-Core' 'Metacello-ToolBox') ];
                yourself.
            spec
                group: 'default' with: #('Metacello-Core' 'Metacello-ToolBox' 'Metacello-GitHub');
                group: 'bootstrap' with: #('Metacello-Core');
                group: 'batch' with: #('bootstrap' 'Metacello-GitHub');
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
                                versionString: #'stable';
                                repository: 'http://www.squeaksource.com/MetacelloRepository';
                                repository: 'http://seaside.gemstone.com/ss/metacello' ];
                yourself.
            spec
                package: 'Metacello-GitHub' with: [ spec requires: #('OSProcess') ];
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
                package: 'Metacello-Platform' with: 'Metacello-Platform.pharo';
                yourself.
            spec
                group: 'Tests' with: #('Metacello-TestsProfStef');
                group: 'Tutorial' with: #('Metacello-ProfStef');
                yourself ].
    spec
        for: #'squeak'
        do: [ 
            spec yourself.
            spec
                package: 'Metacello-Platform' with: 'Metacello-Platform.squeak';
                yourself ].
    spec
        for: #'gemstone'
        do: [ 
            spec
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
                package: 'Metacello-MC' with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
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