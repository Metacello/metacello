versions
version10beta3217: spec
  <version: '1.0.0-beta.32.17'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '1.0-beta.32.17: add support for Pharo4.0
  https://github.com/dalehenrich/metacello-work/issues?q=milestone%3A1.0.0-beta.32.17+is%3Aclosed'.
      spec author: 'dkh'.
      spec timestamp: '11/11/2014 10:16'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:e54f0a833fa31e7a7728bf886aca6c43e1e8f6a5/repository' ];
        import: 'Metacello' ]