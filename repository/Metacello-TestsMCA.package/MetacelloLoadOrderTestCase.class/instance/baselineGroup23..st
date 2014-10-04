baselines
baselineGroup23: spec
  <version: '2.3-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Example-Core';
        package: 'Example-AddOn' with: [ spec requires: #('Core Group') ].
      spec group: 'Core Group' with: #('Example-Core' 'Example-AddOn') ]