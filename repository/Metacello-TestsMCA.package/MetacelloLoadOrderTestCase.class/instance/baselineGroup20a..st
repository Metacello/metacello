baselines
baselineGroup20a: spec
  <version: '2.0-a-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Example-Core';
        package: 'Example-AddOn' with: [ spec requires: #('Core Group') ];
        package: 'Example-Tests' with: [ spec requires: #('AddOn Group') ];
        package: 'Example-TestsUI' with: [ spec requires: #('UI Group') ];
        package: 'Example-UI' with: [ spec requires: #('AddOn Group') ].
      spec
        group: 'UI Group' with: #('Example-UI');
        group: 'Core Group' with: #('Example-Core');
        group: 'AddOn Group' with: #('Example-AddOn');
        yourself ]