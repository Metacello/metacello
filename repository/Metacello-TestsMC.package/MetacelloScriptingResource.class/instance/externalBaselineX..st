external repository
externalBaselineX: spec
    <baseline>
    spec
        package: 'External-Core';
        package: 'External-Tests' with: [ spec requires: 'External-Core' ];
        yourself.
    spec
        group: 'Core' with: #('External-Core');
        group: 'default' with: #('Core');
        group: 'Tests' with: #('External-Tests');
        yourself