baselines
baselineGroup21: spec
  <version: '2.1-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Example-Core';
        package: 'Example-CoreB' with: [ spec requires: 'Example-Core' ];
        package: 'Example-Sub1' with: [ spec requires: 'Example-CoreB' ];
        package: 'Example-Sub2' with: [ spec requires: 'Example-Sub1' ];
        package: 'Example-AddOn' with: [ spec requires: #('Core Group') ];
        package: 'Example-Tests' with: [ spec requires: #('AddOn Group') ];
        package: 'Example-TestsUI' with: [ spec requires: #('TestsUI Group') ];
        package: 'Example-UI' with: [ spec requires: #('AddOn Group') ].
      spec
        group: 'TestsUI Group' with: #('UI Group' 'Example-Tests');
        group: 'Sub Group' with: #('Example-Sub1' 'Example-Sub2' 'Core Group');
        group: 'Core Group' with: #('Example-Core' 'Example-CoreB');
        group: 'AddOn Group' with: #('Example-AddOn');
        group: 'UI Group' with: #('Example-UI' 'Sub Group');
        yourself ]