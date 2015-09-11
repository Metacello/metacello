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
      spec timestamp: '9/11/2015 15:36'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:7deb62a415343f8ba8294c84c9c3438c75455fe3/repository' ];
        import: 'Metacello' ]