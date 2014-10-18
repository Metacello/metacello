baselines
baselineGroup41: spec
  "non-existent reuiquires:"

  <version: '4.1-baseline'>
  spec
    for: #'common'
    do: [ spec package: 'Example-Test' with: [ spec includes: #('Example-Core') ] ]