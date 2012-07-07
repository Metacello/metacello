versions
version10beta32: spec
    <version: '1.0-beta.32' imports: #('1.0-beta.32-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec author: 'dkh'.
            spec timestamp: '7/7/2012 08:00'.
            spec postLoadDoIt: #'metacelloPrimeRegistry'.
            spec
                project: 'FileTree' with: '1.0';
                project: 'Gofer' with: '1.0.5.1';
                project: 'Gofer Tests' with: '1.0.5.1'.
            spec
                package: 'Metacello-Base' with: 'Metacello-Base-dkh.78';
                package: 'Metacello-Core' with: 'Metacello-Core-dkh.609';
                package: 'Metacello-FileTree' with: 'Metacello-FileTree-dkh.28';
                package: 'Metacello-GitHub' with: 'Metacello-GitHub-dkh.17';
                package: 'Metacello-MC' with: 'Metacello-MC-dkh.639';
                package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.33';
                package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
                package: 'OB-Metacello' with: 'OB-Metacello-dkh.83';
                package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.19';
                package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.26';
                package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.278';
                package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.36';
                package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.115' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                project: 'OSProcess' with: '4.4.5';
                project: 'OmniBrowser' with: #'stable';
                project: 'HelpSystem' with: '1.1'.
            spec
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.7';
                package: 'Metacello-Help' with: 'Metacello-Help-dkh.11' ].
    spec
        for: #'pharo'
        do: [ 
            spec project: 'ProfStef' with: #'stable'.
            spec
                package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.10';
                package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-dkh.2';
                package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.27' ].
    spec for: #'pharo1.2.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo1.3.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo2.x' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo20-SeanDeNigris.28' ].
    spec for: #'squeak' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.13' ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'OmniBrowser' with: #'stable';
                project: 'Monticello' with: '0.242'.
            spec
                package: 'Metacello-MC' with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-dkh.4';
                package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.24' ]