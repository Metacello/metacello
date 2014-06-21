baselines
version10: spec
  <version: '1.0' imports: #('1.0-baseline')>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Seaside3'
        with: [ spec repository: 'github://glassdb/Seaside31:3.1.1-gs31/repository' ] ]