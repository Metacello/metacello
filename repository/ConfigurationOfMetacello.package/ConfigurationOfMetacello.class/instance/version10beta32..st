versions
version10beta32: spec
    <version: '1.0-beta.32' imports: #('1.0-beta.32-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'equivalent to 6fb14916d605429808f10bb2bc90be8f320beb42
snap off a release for GLASS 1.0-beta.9
- unimplemented message being sent in MetacelloProjectSpec>>asProjectRegistration
  https://github.com/dalehenrich/metacello-work/issues/139
- squeak4.3.x and squeak4.4.x added as platform attributes
  https://github.com/dalehenrich/metacello-work/issues/140'.
            spec author: 'dkh'.
            spec timestamp: '2/28/2013 09:57'.
            spec postLoadDoIt: #'metacelloPrimeRegistry'.
            spec
                project: 'FileTree' with: '1.0.1';
                project: 'Gofer' with: '1.0.5.1';
                project: 'Gofer Tests' with: '1.0.5.1'.
            spec
                package: 'Metacello-Base' with: 'Metacello-Base-dkh.103';
                package: 'Metacello-Core' with: 'Metacello-Core-dkh.669';
                package: 'Metacello-FileTree' with: 'Metacello-FileTree-dkh.29';
                package: 'Metacello-GitHub' with: 'Metacello-GitHub-dkh.22';
                package: 'Metacello-MC' with: 'Metacello-MC-dkh.669';
                package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.35';
                package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.26';
                package: 'OB-Metacello' with: 'OB-Metacello-dkh.83';
                package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-dkh.20';
                package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.31';
                package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.352';
                package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.40';
                package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.131' ].
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
                package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-dkh.13';
                package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-dkh.4';
                package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.30' ].
    spec for: #'pharo1.2.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo1.3.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo2.x' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.pharo20-dkh.30' ].
    spec for: #'squeak' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.16' ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'OmniBrowser' with: #'stable';
                project: 'GsCore' with: '0.247';
                project: 'GsMonticello' with: '0.244.2'.
            spec
                package: 'Metacello-MC' with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-dkh.4';
                package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.29' ].
