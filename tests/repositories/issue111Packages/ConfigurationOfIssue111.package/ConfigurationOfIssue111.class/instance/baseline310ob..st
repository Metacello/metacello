baselines-31
baseline310ob: spec
    <version: '3.1.0-ob-baseline' imports: #('3.1.0-common-baseline')>
    #(#'squeak' #'pharo1.0.x' #'pharo1.1.x' #'pharo1.2.x' #'pharo1.4.x' #'pharo2.x')
        do: [ :each | 
            spec
                for: each
                do: [ 
                    spec blessing: #'baseline'.
                    self buildObConfiguration: 'ConfigurationOfOmniBrowser' loading: 'Core' with: spec ] ].
    spec
        for: #'pharo1.3.x'
        do: [ 
            spec blessing: #'baseline'.
            self buildObConfiguration: 'ConfigurationOfOmniBrowserLukas' loading: 'default' with: spec ].
    spec
        for: #'gemstone'
        do: [ 
            spec blessing: #'baseline'.
            spec
                package: 'Seaside-Tools-OmniBrowser'
                with: [ 
                    spec
                        requires: #('OB' 'Seaside-Tools-Core');
                        includes: #('Seaside-GemStone-Tools-OmniBrowser') ].
            spec package: 'Seaside-GemStone-Tools-OmniBrowser' with: [ spec requires: #('Seaside-Tools-OmniBrowser') ].
            spec group: 'OmniBrowser' with: #('Seaside-Tools-OmniBrowser') ]