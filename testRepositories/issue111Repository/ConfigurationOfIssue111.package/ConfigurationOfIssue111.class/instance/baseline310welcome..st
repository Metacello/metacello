baselines-31
baseline310welcome: spec
    <version: '3.1.0-welcome-baseline' imports:
        #('3.1.0-common-baseline' '3.1.0-adaptors-baseline' '3.1.0-rss-baseline' '3.1.0-jqueryui-baseline' '3.1.0-ob-baseline' '3.1.0-comet-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
            spec
                package: 'Seaside-Welcome'
                    with: [ 
                            spec
                                requires:
                                    #('Seaside-Environment' 'Seaside-Tools-Web' 'Seaside-Widgets' 'Seaside-Examples' 'Seaside-Development' 'Seaside-Flow' 'Seaside-Tests-Flow' 'JQuery-Core' 'JQuery-UI') ];
                package: 'Seaside-Tests-Welcome' with: [ spec requires: #('Seaside-Welcome') ].
            spec
                group: 'Welcome' with: #('Seaside-Welcome');
                group: 'Welcome Tests' with: #('Seaside-Tests-Welcome') ].
    spec
        for: #'squeak'
        do: [ 
            spec
                package: 'Seaside-Welcome' with: [ spec includes: #('Seaside-Squeak-Welcome') ];
                package: 'Seaside-Squeak-Welcome' with: [ spec requires: #('Seaside-Welcome') ] ].
    spec
        for: #'pharo'
        do: [ 
            spec
                package: 'Seaside-Welcome' with: [ spec includes: #('Seaside-Pharo-Welcome') ];
                package: 'Seaside-Pharo-Welcome' with: [ spec requires: #('Seaside-Welcome') ].	"spec
			group: 'OneClick' with: #('Core' 'Development' 'Welcome' 'RSS Examples' 'Comet Examples' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-Examples' 'Seaside-Tools-Web' 'Seaside-Tools-OmniBrowser' 'Kom')"
            spec
                group: 'OneClick'
                with:
                    #('Core' 'Development' 'Welcome' 'RSS-Examples' 'Comet-Examples' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-Examples' 'Seaside-Tools-Web' 'Seaside-Tools-OmniBrowser' 'Kom') ]