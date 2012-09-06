versions-31
version310filesystem: spec
    <version: '3.1.0-filesystem' imports: #('3.1.0-filesystem-baseline')>
    spec
        for: #'common'
        do: [ 
            spec
                package: 'Seaside-FileSystem' with: 'Seaside-FileSystem-pmm.26';
                package: 'Seaside-Tests-FileSystem' with: 'Seaside-Tests-FileSystem-lr.13' ]