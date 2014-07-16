specs
version091: spec
  <version: '0.9.1' imports: #('1.0-baseline')>
  spec
    for: #'common'
    do: [ 
      spec
        blessing: #'release';
        baseline: 'Seaside3'
          with: [ spec repository: 'github://glassdb/Seaside31:gemstone3.1/repository' ];
        configuration: 'External'
          with: [ 
              spec
                version: '1.0.0';
                loads: 'External Core';
                repository: 'http://ss3.gemtalksystems.com/ss/external' ];
        yourself ]