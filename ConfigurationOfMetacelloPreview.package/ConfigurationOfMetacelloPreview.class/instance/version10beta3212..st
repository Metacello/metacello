versions
version10beta3212: spec
  <version: '1.0.0-beta.32.12'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '- fix for Issue #212: ineffective MetacelloProjectRegistry>>primeRegistryFromImage
  https://github.com/dalehenrich/metacello-work/issues/212'.
      spec author: 'dkh'.
      spec timestamp: '11/9/2013 07:26'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:8d57503cbcdb4cbf31730e6d9b12b18a55fa0171/repository' ];
        import: 'Metacello' ]