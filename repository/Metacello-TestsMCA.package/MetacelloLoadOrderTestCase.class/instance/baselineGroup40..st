baselines
baselineGroup40: spec
  "non-existent reuiquires:"

  <version: '4.0-baseline'>
  spec
    for: #'common'
    do: [ spec package: 'Example-Test' with: [ spec requires: #('Example-Core') ] ]