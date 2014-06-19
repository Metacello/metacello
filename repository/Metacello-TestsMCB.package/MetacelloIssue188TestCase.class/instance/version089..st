specs
version089: spec
  <version: '0.8.9' imports: #('1.0-baseline')>
  spec
    for: #'common'
    do: [ 
      spec
        blessing: #'release';
        baseline: 'Seaside3'
          with: [ 
              "the versionString puts this version in the errorMap ... its' cool"
              spec
                versionString: '12345';
                repository: 'github://glassdb/Seaside31:gemstone3.1/repository' ];
        yourself ]