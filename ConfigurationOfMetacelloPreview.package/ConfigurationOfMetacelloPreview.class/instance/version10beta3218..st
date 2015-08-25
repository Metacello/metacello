versions
version10beta3218: spec
  <version: '1.0.0-beta.32.18'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec
        description:
          '1.0-beta.32.18: add support for Squeak 4.6 & 5.0
  https://github.com/dalehenrich/metacello-work/issues?q=milestone%3A1.0.0-beta.32.17+is%3Aclosed'.
      spec author: 'pad'.
      spec timestamp: '8/21/2015 11:16'.
      spec
        baseline: 'Metacello'
          with: [ 
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:ffa18f42148e29edbe62ad84a35a4ae019490e9a/repository' ];
        import: 'Metacello' ]
