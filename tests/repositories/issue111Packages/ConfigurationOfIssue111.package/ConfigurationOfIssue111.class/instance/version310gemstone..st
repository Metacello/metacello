versions-31
version310gemstone: spec
    <version: '3.1.0-gemstone' imports: #('3.1.0-gemstone-baseline')>
    spec
        for: #'gemstone'
        do: [ 
            spec
                package: 'Seaside-Core' with: 'Seaside-Core.gemstone-dkh.769';
                package: 'Seaside-Canvas' with: 'Seaside-Canvas.gemstone-dkh.119';
                package: 'Seaside-GemStone-Basic-Development' with: 'Seaside-GemStone-Basic-Development-NickAger.25';
                package: 'Seaside-GemStone-Continuation' with: 'Seaside-GemStone-Continuation-DaleHenrichs.20';
                package: 'Seaside-GemStone-Core' with: 'Seaside-GemStone-Core-dkh.63';
                package: 'Seaside-GemStone-Development' with: 'Seaside-GemStone-Development-dkh.27';
                package: 'Seaside-GemStone-Environment' with: 'Seaside-GemStone-Environment-dkh.12';
                package: 'Seaside-GemStone-Email' with: 'Seaside-GemStone-Email-topa.13';
                package: 'Seaside-GemStone-Flow' with: 'Seaside-GemStone-Flow-DaleHenrichs.11';
                package: 'Seaside-GemStone-Session' with: 'Seaside-GemStone-Session-DaleHenrichs.3';
                package: 'Seaside-GemStone-ServiceTask' with: 'Seaside-GemStone-ServiceTask-NickAger.20';
                package: 'Seaside-GemStone-Tools-Production' with: 'Seaside-GemStone-Tools-Production-dkh.13';
                package: 'Seaside-GemStone-Tools-Web' with: 'Seaside-GemStone-Tools-Web-DaleHenrichs.4';
                package: 'Seaside-RenderLoop' with: 'Seaside-RenderLoop.gemstone-dkh.74';
                package: 'Seaside-Session' with: 'Seaside-Session.gemstone-dkh.158';
                package: 'Seaside-Tests-GemStone-Continuation'
                    with: 'Seaside-Tests-GemStone-Continuation-DaleHenrichs.12';
                package: 'Seaside-Tests-GemStone-Core' with: 'Seaside-Tests-GemStone-Core-dkh.15';
                package: 'Seaside-Tests-GemStone-Development' with: 'Seaside-Tests-GemStone-Development-DaleHenrichs.4';
                package: 'Seaside-Tests-GemStone-Flow' with: 'Seaside-Tests-GemStone-Flow-dkh.4';
                package: 'Seaside-Tests-GemStone-Functional' with: 'Seaside-Tests-GemStone-Functional-dkh.12';
                package: 'Seaside-Tests-RenderLoop' with: 'Seaside-Tests-RenderLoop.gemstone-dkh.13' ].
    spec
        for: #'gs2.4.x'
        do: [ spec package: 'Seaside-GemStone240-Core' with: 'Seaside-GemStone240-Core-DaleHenrichs.3' ].
    spec for: #'gs3.x' do: [ spec package: 'Seaside-GemStone300-Core' with: 'Seaside-GemStone300-Core-DaleHenrichs.4' ]