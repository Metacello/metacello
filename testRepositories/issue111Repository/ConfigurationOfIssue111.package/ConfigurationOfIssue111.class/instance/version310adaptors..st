versions-31
version310adaptors: spec
    <version: '3.1.0-adaptors' imports: #('3.1.0-adaptors-baseline')>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'Seaside-Swazoo' with: 'Seaside-Swazoo-pmm.20';
                package: 'Seaside-Adaptors-Swazoo' with: 'Seaside-Adaptors-Swazoo-pmm.43';
                package: 'Zinc-Seaside' with: 'Zinc-Seaside-SvenVanCaekenberghe.32' ].
    spec
        for: #'pharo'
        do: [ 
            spec
                package: 'KomHttpServerLight' with: 'KomHttpServerLight-pmm.11';
                package: 'Seaside-Adaptors-Comanche' with: 'Seaside-Adaptors-Comanche-pmm.73';
                package: 'Seaside-Tests-Adaptors-Comanche' with: 'Seaside-Tests-Adaptors-Comanche-pmm.14' ].
    spec for: #'squeak' do: [ spec package: 'WebClient-Seaside' with: 'WebClient-Seaside-ar.10' ]