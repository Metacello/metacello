versions
version10beta3211: spec
  <version: '1.0.0-beta.32.11'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '- temporary patch for Issue #212: ineffective MetacelloProjectRegistry>>primeRegistryFromImage
  https://github.com/dalehenrich/metacello-work/issues/212'.
      spec author: 'dkh'.
      spec timestamp: '11/8/2013 21:36'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:7cba83167ab7ab9548460ba176d9b0485345be3c/repository' ];
        import: 'Metacello' ]