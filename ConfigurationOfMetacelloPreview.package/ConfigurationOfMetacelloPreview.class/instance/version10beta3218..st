versions
version10beta3218: spec
  <version: '1.0.0-beta.32.18'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '1.0-beta.32.18: add support for Squeak4.6 and Squeak5.0
  https://github.com/dalehenrich/metacello-work/issues?q=milestone%3A1.0.0-beta.32.18+is%3Aclosed'.
      spec author: 'dkh'.
      spec timestamp: '8/24/2015 14:06'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:a3aec6fa5cb87d7d9f5000a7c51d616a3335f05f' ];
        import: 'Metacello' ]