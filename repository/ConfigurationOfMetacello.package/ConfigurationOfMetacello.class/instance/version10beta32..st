versions
version10beta32: spec
    <version: '1.0-beta.32' imports: #('1.0-beta.32-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'equivalent to 72944619d66f8546fcdfe536adb8fd966a578cf6'.
            spec author: 'dkh'.
            spec timestamp: '7/27/2012 01:38'.
            spec postLoadDoIt: #'metacelloPrimeRegistry'.
            spec
                project: 'FileTree' with: '1.0';
                project: 'Gofer' with: '1.0.5.1';
                project: 'Gofer Tests' with: '1.0.5.1'.
            spec
                package: 'Metacello-Base' with: 'Metacello-Base-dkh.96';
                package: 'Metacello-Core' with: 'Metacello-Core-dkh.663';
                package: 'Metacello-FileTree' with: 'Metacello-FileTree-dkh.29';
                package: 'Metacello-GitHub' with: 'Metacello-GitHub-dkh.22';
                package: 'Metacello-MC' with: 'Metacello-MC-dkh.655';
                package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.35';
                package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.26';
                package: 'OB-Metacello' with: 'OB-Metacello-dkh.83';
                package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.20';
                package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.27';
                package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.328';
                package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.40';
                package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.116' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                project: 'OSProcess' with: '4.4.5';
                project: 'OmniBrowser' with: #'stable';
                project: 'HelpSystem' with: '1.1'.
            spec
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.8';
                package: 'Metacello-Help' with: 'Metacello-Help-dkh.12' ].
    spec
        for: #'pharo'
        do: [ 
            spec project: 'ProfStef' with: #'stable'.
            spec
                package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-dkh.11';
                package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-dkh.3';
                package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.29' ].
    spec for: #'pharo1.2.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo1.3.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo2.x' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo20-dkh.29' ].
    spec for: #'squeak' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.14' ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'OmniBrowser' with: #'stable';
                project: 'GsCore' with: '0.247';
                project: 'GsMonticello' with: '0.242'.
            spec
                package: 'Metacello-MC' with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-dkh.4';
                package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.26' ]