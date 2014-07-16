baselines
baseline10: spec
  <version: '1.0-baseline'>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Seaside3'
          with: [ spec repository: 'github://glassdb/Seaside31:gemstone3.1/repository' ];
        import: 'Seaside3' ]