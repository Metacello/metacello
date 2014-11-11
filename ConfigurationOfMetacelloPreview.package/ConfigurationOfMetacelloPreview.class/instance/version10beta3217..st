versions
version10beta3217: spec
  <version: '1.0.0-beta.32.17'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec
        description:
          '1.0-beta.32.17: add support for Pharo4.0
  https://github.com/dalehenrich/metacello-work/issues?q=milestone%3A1.0.0-beta.32.17+is%3Aclosed'.
      spec author: 'dkh'.
      spec timestamp: '11/11/2014 10:16'.
      spec
        baseline: 'Metacello'
          with: [ 
              "This SHA is only temporary ... pointing at issue_273 branch not master ... for testing only"
              spec
                loads: #('batch');
                repository:
                    'github://dalehenrich/metacello-work:a7f763f558741c918784cc7818b48fdea2ea46bd/repository' ];
        import: 'Metacello' ]