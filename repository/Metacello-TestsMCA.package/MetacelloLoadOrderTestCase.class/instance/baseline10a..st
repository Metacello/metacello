baselines
baseline10a: spec
  <version: '1.0-a-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Example-Core';
        package: 'Example-AddOn' with: [ spec requires: #('Example-Core') ];
        package: 'Example-Tests' with: [ spec requires: #('Example-AddOn') ];
        package: 'Example-TestsUI' with: [ spec requires: #('Example-UI') ];
        package: 'Example-UI' with: [ spec requires: #('Example-AddOn') ] ]