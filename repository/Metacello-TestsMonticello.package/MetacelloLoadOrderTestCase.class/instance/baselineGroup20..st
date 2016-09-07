baselines
baselineGroup20: spec
  <version: '2.0-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Example-Core';
        package: 'Example-AddOn' with: [ spec requires: #('Core Group') ];
        package: 'Example-Tests' with: [ spec requires: #('AddOn Group') ];
        package: 'Example-TestsUI' with: [ spec requires: #('TestsUI Group') ];
        package: 'Example-UI' with: [ spec requires: #('AddOn Group') ].
      spec
        group: 'TestsUI Group' with: #('Example-UI' 'Example-Tests');
        group: 'Core Group' with: #('Example-Core');
        group: 'AddOn Group' with: #('Example-AddOn');
        yourself ]