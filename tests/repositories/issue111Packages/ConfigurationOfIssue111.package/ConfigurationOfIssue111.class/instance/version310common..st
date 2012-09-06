versions-31
version310common: spec
    <version: '3.1.0-common' imports: #('3.1.0-common-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'release'.
            spec description: 'release 3.1.0 see http://code.google.com/p/seaside/wiki/Seaside310Changelog'.
            spec
                package: 'Seaside-Canvas' with: 'Seaside-Canvas-pmm.122';
                package: 'Seaside-Component' with: 'Seaside-Component-pmm.94';
                package: 'Seaside-Core' with: 'Seaside-Core-pmm.773';
                package: 'Seaside-Development' with: 'Seaside-Development-pmm.161';
                package: 'Seaside-Email' with: 'Seaside-Email-pmm.22';
                package: 'Seaside-Environment' with: 'Seaside-Environment-pmm.79';
                package: 'Seaside-Examples' with: 'Seaside-Examples-lr.23';
                package: 'Seaside-Flow' with: 'Seaside-Flow-pmm.24';
                package: 'Seaside-HTML5' with: 'Seaside-HTML5-pmm.31';
                package: 'Seaside-InternetExplorer' with: 'Seaside-InternetExplorer-pmm.7';
                package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop-jf.83';
                package: 'Seaside-Session' with: 'Seaside-Session-pmm.165';
                package: 'Seaside-Tools-Core' with: 'Seaside-Tools-Core-jf.22';
                package: 'Seaside-Widgets' with: 'Seaside-Widgets-pmm.29';
                package: 'Seaside-Tools-Web' with: 'Seaside-Tools-Web-pmm.114';
                package: 'Seaside-Tests-Canvas' with: 'Seaside-Tests-Canvas-dkh.58';
                package: 'Seaside-Tests-Component' with: 'Seaside-Tests-Component-jok.33';
                package: 'Seaside-Tests-Core' with: 'Seaside-Tests-Core-pmm.258';
                package: 'Seaside-Tests-Development' with: 'Seaside-Tests-Development-pmm.44';
                package: 'Seaside-Tests-Email' with: 'Seaside-Tests-Email-lr.14';
                package: 'Seaside-Tests-Environment' with: 'Seaside-Tests-Environment-pmm.28';
                package: 'Seaside-Tests-Examples' with: 'Seaside-Tests-Examples-pmm.10';
                package: 'Seaside-Tests-Flow' with: 'Seaside-Tests-Flow-pmm.35';
                package: 'Seaside-Tests-Functional' with: 'Seaside-Tests-Functional-pmm.149';
                package: 'Seaside-Tests-HTML5' with: 'Seaside-Tests-HTML5-pmm.33';
                package: 'Seaside-Tests-InternetExplorer' with: 'Seaside-Tests-InternetExplorer-lr.9';
                package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop-lr.13';
                package: 'Seaside-Tests-Session' with: 'Seaside-Tests-Session-jf.69';
                package: 'Seaside-Tests-Tools-Web' with: 'Seaside-Tests-Tools-Web-jf.21';
                package: 'Seaside-Tests-UTF8' with: 'Seaside-Tests-UTF8-pmm.12' ]