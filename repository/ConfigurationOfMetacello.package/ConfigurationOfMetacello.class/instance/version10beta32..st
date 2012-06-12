versions
version10beta32: spec
    <version: '1.0-beta.32' imports: #('1.0-beta.32-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec author: 'dkh'.
            spec timestamp: '6/12/2012 09:37'.
            spec
                project: 'FileTree' with: '1.0';
                project: 'Gofer' with: '1.0.5.1';
                project: 'Gofer Tests' with: '1.0.5.1'.
            spec
                package: 'Metacello-Base' with: 'Metacello-Base-dkh.64';
                package: 'Metacello-Core' with: 'Metacello-Core-dkh.578';
                package: 'Metacello-FileTree' with: 'Metacello-FileTree-dkh.28';
                package: 'Metacello-GitHub' with: 'Metacello-GitHub-dkh.9';
                package: 'Metacello-MC' with: 'Metacello-MC-dkh.619';
                package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.33';
                package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
                package: 'OB-Metacello' with: 'OB-Metacello-dkh.82';
                package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
                package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.16';
                package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.169';
                package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.32';
                package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.114' ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'OmniBrowser' with: #'stable';
                project: 'Monticello' with: '0.242'.
            spec
                package: 'Metacello-MC' with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-dkh.4';
                package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.24' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                project: 'OSProcess' with: #'stable';
                project: 'OmniBrowser' with: #'stable';
                project: 'HelpSystem' with: '1.1'.
            spec
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.5';
                package: 'Metacello-Help' with: 'Metacello-Help-dkh.11' ].
    spec
        for: #'pharo'
        do: [ 
            spec project: 'ProfStef' with: #'stable'.
            spec
                package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.10';
                package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-DaleHenrichs.1';
                package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.27' ].
    spec for: #'pharo1.2.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo1.3.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'squeak' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.12' ]