versions-31
version310ob: spec
    <version: '3.1.0-ob' imports: #('3.1.0-ob-baseline')>
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                package: 'Seaside-Pharo-Tools-OmniBrowser' with: 'Seaside-Pharo-Tools-OmniBrowser.pharoOB-NickAger.7';
                package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-pmm.27' ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                package: 'Seaside-GemStone-Tools-OmniBrowser' with: 'Seaside-GemStone-Tools-OmniBrowser-DaleHenrichs.4';
                package: 'Seaside-Tools-OmniBrowser' with: 'Seaside-Tools-OmniBrowser-pmm.27' ]