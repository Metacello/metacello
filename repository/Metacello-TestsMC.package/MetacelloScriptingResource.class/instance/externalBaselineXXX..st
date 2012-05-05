external repository
externalBaselineXXX: spec
    <baseline>
    spec
        for: #common
        do: [ 
            spec
                package: 'External-Core';
                package: 'External-Tests' with: [ spec requires: 'External-Core' ];
                yourself.
            spec
                group: 'Core' with: #('External-Core');
                group: 'default' with: #('Core');
                group: 'Tests' with: #('External-Tests');
                yourself ].
    spec
        for: #custom
        do: [ 
            spec package: 'External-UI'.
            spec group: 'UI' with: #('External-UI') ]